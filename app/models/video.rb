# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :video_languages, dependent: :destroy
  has_many :video_categories, dependent: :destroy
  has_many :video_speakers, dependent: :destroy
  has_many :video_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :watched_videos, dependent: :destroy

  has_many :tags, through: :video_tags
  has_many :languages, through: :video_languages
  has_many :speakers, through: :video_speakers
  has_many :categories, through: :video_categories

  mount_uploader :picture_url, PictureUrlUploader
  mount_uploader :video_url, VideoUrlUploader

  validates :video_name, presence: true
  validates :video_description, presence: true
  validates :picture_url, presence: true
  validates :video_url, presence: true

  paginates_per 25

  scope :by_name, ->(name) { where('video_name like ?', "%#{name}%") }
  scope :by_tag, ->(tag_id) { joins(:video_tags).where(video_tags: { tag_id: }) }
  scope :by_language, ->(language_id) { joins(:video_languages).where(video_languages: { language_id: }) }
  scope :by_speaker, ->(speaker_id) { joins(:video_speakers).where(video_speakers: { speaker_id: }) }
  scope :by_category, ->(category_id) { joins(:video_categories).where(video_categories: { category_id: }) }
end
