# frozen_string_literal: true

class VideoScreenwriter < ApplicationRecord
  belongs_to :video
  belongs_to :screenwriter
end
