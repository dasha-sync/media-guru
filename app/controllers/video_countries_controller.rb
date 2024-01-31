# frozen_string_literal: true

class VideoCountriesController < ApplicationController
  before_action :set_video
  before_action :set_video_country, only: %i[show destroy]

  def index
    @video_countries = @video.video_countries
  end

  def show; end

  def new
    @video_country = VideoCountry.new
  end

  def create
    @video_country = @video.video_countries.new(video_country_params)

    if @video_country.save
      redirect_to video_path(@video), notice: 'Страна успешно добавлена.'
    else
      flash.now[:alert] = 'Страна не может быть добавлена по какой-то причине.'
      render :new
    end
  end

  def destroy
    if @video_country.destroy
      redirect_to video_path(@video), notice: 'Страна успешно удалена.'
    else
      flash.now[:alert] = 'Страна не может быть удалена по какой-то причине.'
      render :show
    end
  end

  private

  def set_video_country
    @video_country = @video.video_countries.find(params[:id])
  end

  def video_country_params
    params.require(:video_country).permit(:country)
  end

  def set_video
    @video = Video.find(params[:video_id])
  end
end
