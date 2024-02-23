# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_video
  before_action :set_favorite, only: %i[edit show update destroy]

  def index
    @favorites = @video.favorites
    @favorite = Favorite.new
  end

  def show; end

  def new
    @favorite = Favorite.new
  end

  def edit; end

  def create
    @favorite = @video.favorites.new(favorite_params)

    @favorite.user = current_user if current_user

    if @favorite.save
      redirect_to video_path(@video), notice: 'Видео успешно добавлено в избранные успешно добавлена.'
    else
      render :new, status: :unprocessable_entity, error: 'Видео не может быть добавлено в ихбранные по какой-то причине.'
    end
  end

  def update
    if @favorite.update(favorite_params)
      redirect_to video_path(@video), notice: 'Оценка успешно обновлен'
    else
      render :edit, status: :unprocessable_entity, error: 'Оценка не может быть обновлена по какой-то причине.'
    end
  end

  def destroy
    if @favorite.destroy
      redirect_to video_favorite_path, notice: 'Оценка успешно удалена.'
    else
      redirect_to video_favorite_path, error: 'Оценка не может быть удалена по какой-то причине.'
    end
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end

  def set_favorite
    @favorite = current_user.favorites.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit()
  end
end
