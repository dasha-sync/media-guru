# frozen_string_literal: true

class UsersControlController < ApplicationController
  def index; end

  def destroy
    @user = User.find(params[:id])

    if @user.role.zero?
      if @user.destroy
        redirect_to '/users_control/index', notice: 'Пользователь успешно удален.'
      else
        redirect_to '/users_control/index', warning: 'Не удалось удалить пользователя.'
      end
    else
      redirect_to '/users_control/index',
                  warning: 'Административный аккаунт можно удалить только через настройки этого аккаунта.'
    end
  end
end
