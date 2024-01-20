# frozen_string_literal: true

class Director < ApplicationRecord
  has_many :film_directors, dependent: :destroy
  has_many :films, through: :film_directors

  validates :director_fio, presence: true
end
