# frozen_string_literal: true

class FilmsController < ApplicationController
  before_action :set_film, only: %i[edit update destroy]

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      redirect_to films_path, notice: 'Фильм успешно добавлен.'
    else
      render :new, status: :unprocessable_entity, error: 'Фильм не может быть добавлен по какой-то причине.'
    end
  end

  def update
    if @film.update(film_params)
      redirect_to students_path(@film), notice: 'FФильм успешно обновлен'
    else
      render :edit, status: :unprocessable_entity, error: 'Фильм не может быть обновлен по какой-то причине.'
    end
  end

  def edit; end

  def show; end

  def destroy
    if @film.destroy
      redirect_to students_path, notice: 'Фильм успешно удален.'
    else
      redirect_to students_path, error: 'Фильм не может быть удален по какой-то причине'
    end
  end

  private

  def set_film
    @film = Film.all.find(params[:id])
  end

  def film_params
    params.require(:film).permit(:film_name, :film_description, :release_date, :film_link, :image_link)
  end
end
