# frozen_string_literal: true

class Speaker < ApplicationRecord
  has_many :video_speakers, dependent: :destroy

  validates :speaker_fio, presence: true
end
