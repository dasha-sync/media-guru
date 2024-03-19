# frozen_string_literal: true

class WatchedVideo < ApplicationRecord
  belongs_to :user
  belongs_to :video

  scope :watched_video_exist, ->(video, user) { where(video_id: video, user_id: user.id) }

  paginates_per 25
end
