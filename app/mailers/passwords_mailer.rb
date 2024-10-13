class PasswordsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passwords_mailer.reset.subject
  #
  def reset(user)
    @user = user
    mail subject: "Reset your password", to: user.email_address
  end
end
