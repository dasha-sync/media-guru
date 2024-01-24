# frozen_string_literal: true

class FilmGenresController < ApplicationController
  before_action :set_film
  before_action :set_film_genre, only: %i[show destroy]

  def index
    @film_genres = @film.film_genres
  end

  def show; end

  def new
    @film_genre = FilmGenre.new
  end

  def create
    @film_genre = @film.film_directors.new(film_genre_params)

    @film_genre.director = Genre.find(params[:genre_id])

    if @film_genre.save
      flash.now[:notice] = "Жанр успешно добавлен."
    else
      flash.now[:error] = "Жанр не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @film_genre.destroy
      redirect_to film_path(@film), notice: 'Режиссер успешно удален.'
    else
      redirect_to film_path(@film), error: 'Режиссер не может быть удален по какой-то причине'
    end
  end

  private

  def set_film_genre
    @film_genre = @film.film_genres.find(params[:id])
  end

  def film_genre_params
    params.require(:film_genre).permit()
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
