# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_comment_email
    @comment = params[:comment]
    mail(to: 'bogdan@test.com', subject: "There's a new comment from #{@comment.commenter}")
  end
end
