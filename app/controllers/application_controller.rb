class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :name) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :current_password, :name)
    end
  end
end
