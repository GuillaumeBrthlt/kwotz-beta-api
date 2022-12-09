class UserMailer < Devise::Mailer
  default from: "bertholetguillaume@gmail.com" 
 
  def reset_password_instructions(record, token, opts = {})
    super
  end

  def confirmation_instructions(record, token, opts = {})
    super
  end
end
