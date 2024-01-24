# frozen_string_literal: true

class FilmDirectorsController < ApplicationController
  before_action :set_film
  before_action :set_film_director, only: %i[show destroy]

  def index
    @film_directors = @film.film_directors
  end

  def show; end

  def new
    @film_director = FilmDirector.new
  end

  def create
    @film_director = @film.film_directors.new(film_director_params)

    @film_director.director = Directors.find(params[:director_id])

    if @film_director.save
      flash.now[:notice] = "Режиссер успешно добавлен."
    else
      flash.now[:error] = "Режиссер не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @film_director.destroy
      redirect_to film_path(@film), notice: 'Режиссер успешно удален.'
    else
      redirect_to film_path(@film), error: 'Режиссер не может быть удален по какой-то причине'
    end
  end

  private

  def set_film_director
    @film_director = @film.film_directors.find(params[:id])
  end

  def film_director_params
    params.require(:film_director).permit()
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
