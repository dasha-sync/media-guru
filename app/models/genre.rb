# frozen_string_literal: true

class Genre < ApplicationRecord
  validates :genre_name, presence: true
end
