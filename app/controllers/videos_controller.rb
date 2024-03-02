# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :set_video, only: %i[edit show update destroy add_to_favorites delete_from_favorites delete_from_videos_favorites]

  def index
    @videos = Video.order(:video_name).page(params[:page]).per(params[:per_page])
  end

  def show
    @reviews = @video.reviews
    @review = Review.new
    @mark = @video.marks.new
  end

  def new
    @video = Video.new
  end

  def edit; end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to videos_path, notice: 'Видео успешно добавлено.'
    else
      render :new, status: :unprocessable_entity, error: 'Видео не может быть добавлено по какой-то причине.'
    end
  end

  def update
    if @video.update(video_params)
      redirect_to videos_path(@video), notice: 'Видео успешно обновлен.'
    else
      render :edit, status: :unprocessable_entity, error: 'Видео не может быть обновлено по какой-то причине.'
    end
  end

  def destroy
    if @video.destroy
      redirect_to videos_path, notice: 'Видео успешно удалено.'
    else
      redirect_to videos_path, error: 'Видео не может быть удалено по какой-то причине'
    end
  end

  def add_to_favorites
    @favorite = current_user.favorites.new()
    @favorite.video_id = @video.id

    if @favorite.save
      redirect_to videos_path, notice: 'Видео успешно добавлено в избранные.'
    else
      redirect_to videos_path, notice: 'Видео не может быть добавлено в избранные по какойто причине.'
    end
  end

  def delete_from_videos_favorites
    if deleting(@video)
      redirect_to videos_path, notice: 'Видео успешно удалено из избранных.'
    else
      redirect_to videos_path, notice: 'Видео не может быть удалено из избранных по какойто причине.'
    end
  end

  def delete_from_favorites
    if deleting(@video)
      redirect_to favorites_path, notice: 'Видео успешно удалено из избранных.'
    else
      redirect_to favorites_path, notice: 'Видео не может быть удалено из избранных по какойто причине.'
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:video_name, :video_description, :release_date, :picture_url, :video_url)
  end

  def deleting(current_video)
    Favorite.favorite_exist(current_video.id, current_user).each do |favorite|
      return false unless favorite.delete
    end
  end
end
