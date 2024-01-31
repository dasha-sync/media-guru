# frozen_string_literal: true

class VideoDirector < ApplicationRecord
  belongs_to :video
  belongs_to :director
end
