# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :digit, presence: true
end
