class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired. Please try again."
    mail to: params[:user].email
  end
end
