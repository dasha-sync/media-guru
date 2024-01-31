# frozen_string_literal: true

class MarksController < ApplicationController
  before_action :set_film
  before_action :set_mark, only: %i[edit show update destroy]

  def index
    @marks = @film.marks
    @mark = Mark.new
  end

  def show; end

  def new
    @mark = Mark.new
  end

  def edit; end

  def create
    @mark = @film.marks.new(mark_params)

    @mark.user = current_user if current_user

    if @mark.save
      redirect_to film_path(@film), notice: 'Оценка успешно добавлена.'
    else
      render :new, status: :unprocessable_entity, error: 'Оценка не может быть добавлена по какой-то причине.'
    end
  end

  def update
    if @mark.update(mark_params)
      redirect_to film_path(@film), notice: 'Оценка успешно обновлен'
    else
      render :edit, status: :unprocessable_entity, error: 'Оценка не может быть обновлена по какой-то причине.'
    end
  end

  def destroy
    if @mark.destroy
      redirect_to film_mark_path, notice: 'Оценка успешно удалена.'
    else
      redirect_to film_mark_path, error: 'Оценка не может быть удалена по какой-то причине.'
    end
  end

  private

  def set_film
    @film = Film.find(params[:film_id])
  end

  def set_mark
    @mark = @film.marks.find(params[:id])
  end

  def mark_params
    params.require(:mark).permit(:diget)
  end
end
