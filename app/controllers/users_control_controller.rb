# frozen_string_literal: true

require 'fileutils'

class UsersControlController < ApplicationController
  before_action :set_user, only: :destroy
  before_action :set_users, only: :indexv
  before_action :set_user_sessions, only: :user_activity_report

  def index
    @users = User.all.page(params[:page]).per(params[:per_page])
  end

  def show; end

  def destroy
    flash_message =
      if @user.role == 'user'
        @user.destroy ? { notice: 'Пользователь успешно удален.' } : { error: 'Не удалось удалить пользователя.' }
      else
        { error: 'Административный аккаунт можно удалить только через настройки этого аккаунта.' }
      end

    redirect_to '/users_control/index', flash: flash_message
  end

  def user_activity_report
    # Преобразуем время из секунд в минуты
    @user_sessions.each_value do |data|
      data[:total_time] /= 60
    end

    @user_sessions = @user_sessions.sort_by do |_user_id, data|
      data[:total_time]
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'user_activity_report', template: 'users_control/user_activity_report', encoding: 'utf8'
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @users = User.all.page(params[:page]).per(params[:per_page])
  end

  def set_user_sessions
    @user_sessions = UserActivity.all.order(:created_at).each_with_object({}) do |activity, sessions|
      sessions[activity.user_id] ||= { user_id: activity.user_id, total_time: 0 }

      if activity.action == 'login'
        sessions[activity.user_id][:login_time] = activity.login_time
      elsif activity.action == 'logout' && sessions[activity.user_id].present? && sessions[activity.user_id][:login_time].present?
        sessions[activity.user_id][:total_time] += (activity.logout_time - sessions[activity.user_id][:login_time])
      end
    end
  end
end
