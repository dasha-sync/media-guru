# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :video_categories, dependent: :destroy

  validates :category_name, presence: true
end
