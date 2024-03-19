# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?

  protected

  def configure_sign_up_params
    attributes = %i[username email password password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  private

  def after_sign_in_path_for(resource)
    UserActivity.create(user_id: current_user.id, action: 'login', login_time: Time.now.utc)
    root_path
  end
end
