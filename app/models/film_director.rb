# frozen_string_literal: true

class FilmDirector < ApplicationRecord
  belongs_to :film
  belongs_to :director
end
