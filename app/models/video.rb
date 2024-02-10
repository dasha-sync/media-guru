# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :video_languages, dependent: :destroy
  has_many :video_categories, dependent: :destroy
  has_many :video_speakers, dependent: :destroy
  has_many :video_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :marks

  mount_uploader :picture_url, PictureUrlUploader
  mount_uploader :video_url, VideoUrlUploader

  validates :video_name, presence: true
  validates :release_date, presence: true
  validates :video_description, presence: true
  validates :picture_url, presence: true
  validates :video_url, presence: true
end
