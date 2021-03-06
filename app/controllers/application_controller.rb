class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :member, :profile, :works, :avatar)
    devise_parameter_sanitizer.for(:account_update).push(:name, :member, :profile, :works, :avatar)
  end
end
