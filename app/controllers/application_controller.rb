class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    resource
  end

  def after_sign_in_path_for(resource)
    resource
  end

  def after_update_path_for(resource)
    resource
  end
end
