# frozen_string_literal: true

class VideoGenresController < ApplicationController
  before_action :set_video
  before_action :set_video_genre, only: %i[show destroy]

  def index
    @video_genres = @video.video_genres
  end

  def show; end

  def new
    @video_genre = VideoGenre.new
  end

  def create
    @video_genre = @video.video_directors.new(video_genre_params)

    @video_genre.director = Genre.find(params[:genre_id])

    if @video_genre.save
      flash.now[:notice] = "Жанр успешно добавлен."
    else
      flash.now[:error] = "Жанр не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @video_genre.destroy
      redirect_to video_path(@video), notice: 'Режиссер успешно удален.'
    else
      redirect_to video_path(@video), error: 'Режиссер не может быть удален по какой-то причине'
    end
  end

  private

  def set_video_genre
    @video_genre = @video.video_genres.find(params[:id])
  end

  def video_genre_params
    params.require(:video_genre).permit()
  end

  def set_video
    @video = Video.find(params[:video_id])
  end
end
