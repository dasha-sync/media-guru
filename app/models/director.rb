# frozen_string_literal: true

class Director < ApplicationRecord
  validates :director_fio, presence: true
end
