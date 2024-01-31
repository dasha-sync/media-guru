# frozen_string_literal: true

class VideoDirectorsController < ApplicationController
  before_action :set_video
  before_action :set_video_director, only: %i[show destroy]

  def index
    @video_directors = @video.video_directors
  end

  def show; end

  def new
    @video_director = VideoDirector.new
  end

  def create
    @video_director = @video.video_directors.new(video_director_params)

    @video_director.director = Directors.find(params[:director_id])

    if @video_director.save
      flash.now[:notice] = "Режиссер успешно добавлен."
    else
      flash.now[:error] = "Режиссер не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @video_director.destroy
      redirect_to video_path(@video), notice: 'Режиссер успешно удален.'
    else
      redirect_to video_path(@video), error: 'Режиссер не может быть удален по какой-то причине'
    end
  end

  private

  def set_video_director
    @video_director = @video.video_directors.find(params[:id])
  end

  def video_director_params
    params.require(:video_director).permit()
  end

  def set_video
    @video = Video.find(params[:video_id])
  end
end
