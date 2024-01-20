# frozen_string_literal: true

class Screenwriter < ApplicationRecord
  has_many :film_screenwriters, dependent: :destroy

  validates :screenwriter_fio, presence: true
end
