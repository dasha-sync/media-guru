# frozen_string_literal: true

class FilmSpeakersController < ApplicationController
  before_action :set_film
  before_action :set_film_speaker, only: %i[show destroy]

  def index
    @film_speakers = @film.film_speakers
  end

  def show; end

  def new
    @film_speaker = FilmSpeaker.new
  end

  def create
    @film_speaker = @film.film_speakers.new(film_speaker_params)

    @film_speaker.director = Speaker.find(params[:speaker_id])

    if @film_speaker.save
      flash.now[:notice] = "Сценрист успешно добавлен."
    else
      flash.now[:error] = "Сценарист не может быть добавлен по какой-то причине."
    end
  end

  def destroy
    if @film_speaker.destroy
      redirect_to film_path(@film), notice: 'Сценарист успешно удален.'
    else
      redirect_to film_path(@film), error: 'Сценарист не может быть удален по какой-то причине'
    end
  end

  private

  def set_film_speaker
    @film_speaker = @film.film_speaker.find(params[:id])
  end

  def film_speaker_params
    params.require(:film_screenwriter).permit()
  end

  def set_film
    @film = Film.find(params[:film_id])
  end
end
