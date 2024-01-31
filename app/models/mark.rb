# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :digit, presence: true
end
