# frozen_string_literal: true

class Director < ApplicationRecord
  has_many :video_directors, dependent: :destroy
  has_many :videos, through: :video_directors

  validates :director_fio, presence: true
end
