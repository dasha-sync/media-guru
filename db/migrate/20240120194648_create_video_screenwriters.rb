# frozen_string_literal: true

class CreateVideoScreenwriters < ActiveRecord::Migration[7.0]
  def change
    create_table :video_screenwriters do |t|
      t.belongs_to :video, null: false, foreign_key: true
      t.belongs_to :screenwriter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
