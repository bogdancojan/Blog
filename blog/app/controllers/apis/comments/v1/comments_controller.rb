class Apis::Comments::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  after_action :send_email_new_comment, on: :create

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    if @comment.save
      head 200
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    if @comment.destroyed?
      head 200
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def send_email_new_comment
    CommentMailer.with(comment: @comment).new_comment_email.deliver_later
  end
end
