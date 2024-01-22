# frozen_string_literal: true

class Film < ApplicationRecord
  has_many :film_countries, dependent: :destroy
  has_many :film_directors, dependent: :destroy
  has_many :film_screenwriters, dependent: :destroy
  has_many :film_speakers, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploader :picture_url, PictureUrlUploader
  mount_uploader :film_url, FilmUrlUploader

  validates :film_name, presence: true
  validates :release_date, presence: true
  validates :film_description, presence: true
  validates :picture_url, presence: true
  validates :film_url, presence: true
end
