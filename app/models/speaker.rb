# frozen_string_literal: true

class Speaker < ApplicationRecord
  validates :speaker_fio, presence: true
end
