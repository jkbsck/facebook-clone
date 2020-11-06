class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email
    @user = params[:user]
    @url = "http://example.com/users/sign_in"
    mail(to: @user.email, subject: "Welcome to Social Site.")
  end
end
