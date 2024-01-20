# frozen_string_literal: true

class Screenwriter < ApplicationRecord
  validates :screenwriter_fio, presence: true
end
