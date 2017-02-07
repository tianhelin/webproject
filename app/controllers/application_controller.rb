class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user

  protected

  def configure_permitted_parameters
    add_attrs = [:accountname,:name,:birthday, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: add_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: add_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: add_attrs)
  end
private
  def checkadmin
    if current_user.adminkey_id != 1
      redirect_to posts_path
    end
  end

  def current_user
    @current_user ||= User.find(session["warden.user.user.key"][0][0]) if session["warden.user.user.key"]!=nil
  end
end