# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :check_admin_or_owner, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, if: :skip_authenticate_user
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  def create_like
    @article = Article.find(params[:article_id])
    @article.create_like(current_user)

    render turbo_stream: turbo_stream.replace("update_likes", partial: "/articles/likes/like_count", locals: { article: @article })
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def check_admin_or_owner
    article = Article.find(params[:id])
    unless current_user.admin or article.user_id == current_user.id
      redirect_to root_path, alert: "You don't have permission on this article !" 
    end
  end

  def skip_authenticate_user
    action_name == 'show' && request.format.json?
  end
end
