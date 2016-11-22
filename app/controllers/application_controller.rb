class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:birthday, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:birthday, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:birthday, :email, :password, :password_confirmation])
  end
  
  def checkadmin
    if current_user.adminkey != 1
      redirect_to posts_path
    end
  end
end