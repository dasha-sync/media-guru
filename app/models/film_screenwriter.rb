# frozen_string_literal: true

class FilmScreenwriter < ApplicationRecord
  belongs_to :film
  belongs_to :screenwriter
end
