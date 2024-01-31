# frozen_string_literal: true

class Screenwriter < ApplicationRecord
  has_many :video_screenwriters, dependent: :destroy

  validates :screenwriter_fio, presence: true
end
