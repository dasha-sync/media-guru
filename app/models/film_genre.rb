# frozen_string_literal: true

class FilmGenre < ApplicationRecord
  belongs_to :film
  belongs_to :genre
end
