class DevisePreview < ActionMailer::Preview
  #  http://localhost:3000/rails/mailers/devise/confirmation_instructions
  def confirmation_instructions
    user = User.first
    user.confirmation_token = Devise.friendly_token[0,20]
    Devise::Mailer.confirmation_instructions(user, user.confirmation_token)
  end

  #  http://localhost:3000/rails/mailers/devise/reset_password_instructions
  def reset_password_instructions
    user = User.first
    user.reset_password_token = Devise.friendly_token[0,20]
    Devise::Mailer.reset_password_instructions(user, user.reset_password_token)
  end
end
