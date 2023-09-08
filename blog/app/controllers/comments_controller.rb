# frozen_string_literal: true

class CommentsController < ApplicationController
  after_action :send_email_new_comment, on: :create

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  def create_like
    @comment = Comment.find(params[:comment_id])
    @comment.create_like(current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def send_email_new_comment
    CommentMailer.with(comment: @comment).new_comment_email.deliver_later
  end
end
