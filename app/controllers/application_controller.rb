# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include WillPaginate::ViewHelpers

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position, :image])
  end

  def authenticate_admin!
    redirect_to root_path, alert: '管理者権限が必要です' unless current_user&.admin?
  end
end
