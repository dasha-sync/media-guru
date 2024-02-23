# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :video
  belongs_to :user
end
