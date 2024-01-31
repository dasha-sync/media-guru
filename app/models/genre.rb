# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :video_genres, dependent: :destroy

  validates :genre_name, presence: true
end
