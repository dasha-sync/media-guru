# frozen_string_literal: true

class VideoCategoriesController < ApplicationController
  before_action :set_video
  before_action :set_video_category, only: %i[show destroy]

  def index
    @video_categories = @video.video_categories
  end

  def show; end

  def new
    @video_category = Videocategory.new
  end

  def create
    @video_category = @video.video_categories.new(video_category_params)

    @video_category.category = categories.find(params[:category_id])

    if @video_category.save
      flash.now[:notice] = "Категория успешно добавлен."
    else
      flash.now[:error] = "Категория не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @video_category.destroy
      redirect_to video_path(@video), notice: 'Категория успешно удален.'
    else
      redirect_to video_path(@video), error: 'Категория не может быть удален по какой-то причине'
    end
  end

  private

  def set_video_category
    @video_category = @video.video_categories.find(params[:id])
  end

  def video_category_params
    params.require(:video_category).permit()
  end

  def set_video
    @video = Video.find(params[:video_id])
  end
end
