# frozen_string_literal: true

class FilmCountry < ApplicationRecord
  belongs_to :film
  belongs_to :country
end
