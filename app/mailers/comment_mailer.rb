# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_comment_email
    @comment = params[:comment]
    mail(to: 'Bogdan.Cojan@theaccessgroup.com', subject: "There's a new comment from #{@comment.commenter}")
  end
end
