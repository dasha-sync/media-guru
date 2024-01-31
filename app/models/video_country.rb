# frozen_string_literal: true

class VideoCountry < ApplicationRecord
  belongs_to :video
  belongs_to :country
end
