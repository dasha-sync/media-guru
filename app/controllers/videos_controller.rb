# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :set_video, only: %i[edit show update destroy]

  def index
    @videos = Video.all
  end

  def show
    @reviews = @video.reviews
    @review = Review.new
  end

  def new
    @video = Video.new
  end

  def edit; end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to videos_path, notice: 'Фильм успешно добавлен.'
    else
      render :new, status: :unprocessable_entity, error: 'Фильм не может быть добавлен по какой-то причине.'
    end
  end

  def update
    if @video.update(video_params)
      redirect_to videos_path(@video), notice: 'Фильм успешно обновлен.'
    else
      render :edit, status: :unprocessable_entity, error: 'Фильм не может быть обновлен по какой-то причине.'
    end
  end

  def destroy
    if @video.destroy
      redirect_to videos_path, notice: 'Фильм успешно удален.'
    else
      redirect_to videos_path, error: 'Фильм не может быть удален по какой-то причине'
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:video_name, :video_description, :release_date, :picture_url, :video_url)
  end
end
