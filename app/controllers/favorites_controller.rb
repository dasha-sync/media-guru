# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[edit show update destroy]

  def index
    @favorites = current_user.favorites
    @favorite = Favorite.new
  end

  def show; end

  def new
    @favorite = Favorite.new
  end

  def destroy
    if @favorite.destroy
      redirect_to video_favorite_path, notice: 'Оценка успешно удалена.'
    else
      redirect_to video_favorite_path, error: 'Оценка не может быть удалена по какой-то причине.'
    end
  end

  private

  def set_favorite
    @favorite = current_user.favorites.find(params[:id])
  end
end
