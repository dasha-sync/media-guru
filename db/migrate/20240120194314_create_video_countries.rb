# frozen_string_literal: true

class CreateVideoCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :video_countries do |t|
      t.belongs_to :video, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
