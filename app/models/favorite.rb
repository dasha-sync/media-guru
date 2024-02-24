# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :video

  scope :favorite_exist, ->(video, user) { where(video_id: video, user_id: user.id) }
end
