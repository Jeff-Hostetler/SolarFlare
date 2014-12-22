class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def alert_email(user)
    @user = user
    mail(to: @user.email, subject: "SolarFlare detected inefficiency")
  end

end
