# frozen_string_literal: true

class FilmScreenwritersController < ApplicationController
  before_action :set_film
  before_action :set_film_screenwriter, only: %i[show destroy]

  def index
    @film_screenwriters = @film.film_screenwriters
  end

  def show; end

  def new
    @film_screenwriter = FilmScreenwriter.new
  end

  def create
    @film_screenwriter = @film.film_screenwriters.new(film_screenwriter_params)

    @film_screenwriter.director = Screenwriter.find(params[:screenwriter_id])

    if @film_screenwriter.save
      flash.now[:notice] = "Сценрист успешно добавлен."
    else
      flash.now[:error] = "Сценарист не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @film_screenwriter.destroy
      redirect_to film_path(@film), notice: 'Сценарист успешно удален.'
    else
      redirect_to film_path(@film), error: 'Сценарист не может быть удален по какой-то причине'
    end
  end

  private

  def set_film_screenwriter
    @film_screenwriter = @film.film_screenwriters.find(params[:id])
  end

  def film_screenwriter_params
    params.require(:film_screenwriter).permit()
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
