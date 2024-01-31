# frozen_string_literal: true

class CreateVideoDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :video_directors do |t|
      t.belongs_to :video, null: false, foreign_key: true
      t.belongs_to :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
