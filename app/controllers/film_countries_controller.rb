# frozen_string_literal: true

class FilmCountriesController < ApplicationController
  before_action :set_film
  before_action :set_film_country, only: %i[show destroy]

  def index
    @film_countries = @film.film_countries
  end

  def show; end

  def new
    @film_country = FilmCountry.new
  end

  def create
    @film_country = @film.film_countries.new(film_country_params)

    @film_country.country = Countries.find(params[:country_id])

    if @film_country.save
      flash.now[:notice] = "Страна успешно добавлена."
    else
      flash.now[:error] = "Страна не может быть добавлена по какой-то причине."
    end
  end

  def destroy
    if @film_country.destroy
      redirect_to film_path(@film), notice: 'Страна успешно удалена.'
    else
      redirect_to film_path(@film), error: 'Страна не может быть удалена по какой-то причине.'
    end
  end

  private

  def set_film_country
    @film_country = @film.film_countries.find(params[:id])
  end

  def film_country_params
    params.require(:film_country).permit()
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
