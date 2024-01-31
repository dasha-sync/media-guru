# frozen_string_literal: true

class VideoGenre < ApplicationRecord
  belongs_to :video
  belongs_to :genre
end
