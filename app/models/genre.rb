# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :film_genres, dependent: :destroy

  validates :genre_name, presence: true
end
