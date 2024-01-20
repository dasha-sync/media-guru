# frozen_string_literal: true

class Country < ApplicationRecord
  validates :country_name, presence: true
end
