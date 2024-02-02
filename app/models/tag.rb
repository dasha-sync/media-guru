# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :video_tags, dependent: :destroy

  validates :tag_name, presence: true
end
