class CommentNotificationMailer < ApplicationMailer
  default :from => 'henryarbolaez@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_comment_email(comment)
    @comment = comment
    mail( :to => "maxinehernandez@hotmail.com",
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
