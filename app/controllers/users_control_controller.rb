# frozen_string_literal: true

class UsersControlController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  before_action :set_users, only: %i[index show]

  def index
    @users = User.all.page(params[:page]).per(params[:per_page])
  end

  def show
    @users = User.all.page(params[:page]).per(params[:per_page])
  end

  def destroy
    if @user.role == 'user'
      if @user.destroy
        redirect_to '/users_control/index', notice: 'Пользователь успешно удален.'
      else
        redirect_to '/users_control/index', :flash => { :error => 'Не удалось удалить пользователя.' }
      end
    else
      redirect_to '/users_control/index',
      :flash => { :error => 'Административный аккаунт можно удалить только через настройки этого аккаунта.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @users = User.all.page(params[:page]).per(params[:per_page])
  end
end
