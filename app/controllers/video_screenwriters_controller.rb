# frozen_string_literal: true

class VideoScreenwritersController < ApplicationController
  before_action :set_video
  before_action :set_v_screenwriter, only: %i[show destroy]

  def index
    @video_screenwriters = @video.video_screenwriters
  end

  def show; end

  def new
    @video_screenwriter = VideoScreenwriter.new
  end

  def create
    @video_screenwriter = @video.video_screenwriters.new(video_screenwriter_params)

    @video_screenwriter.director = Screenwriter.find(params[:screenwriter_id])

    if @video_screenwriter.save
      flash.now[:notice] = "Сценрист успешно добавлен."
    else
      flash.now[:error] = "Сценарист не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @video_screenwriter.destroy
      redirect_to video_path(@video), notice: 'Сценарист успешно удален.'
    else
      redirect_to video_path(@video), error: 'Сценарист не может быть удален по какой-то причине'
    end
  end

  private

  def set_video_screenwriter
    @video_screenwriter = @video.video_screenwriters.find(params[:id])
  end

  def video_screenwriter_params
    params.require(:video_screenwriter).permit()
  end

  def set_video
    @video = Video.find(params[:video_id])
  end
end
