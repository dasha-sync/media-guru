# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :video_languages, dependent: :destroy

  validates :language_name, presence: true
end
