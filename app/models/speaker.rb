# frozen_string_literal: true

class Speaker < ApplicationRecord
  has_many :film_speakers, dependent: :destroy

  validates :speaker_fio, presence: true
end
