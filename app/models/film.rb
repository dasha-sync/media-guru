# frozen_string_literal: true

class Film < ApplicationRecord
  mount_uploader :picture_url, PictureUrlUploader

  validates :film_name, presence: true
  validates :release_date, presence: true
  validates :film_description, presence: true
  validates :picture_url, presence: true
end
