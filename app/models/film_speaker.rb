# frozen_string_literal: true

class FilmSpeaker < ApplicationRecord
  belongs_to :film
  belongs_to :speaker
end
