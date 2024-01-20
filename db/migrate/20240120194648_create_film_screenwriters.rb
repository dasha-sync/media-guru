# frozen_string_literal: true

class CreateFilmScreenwriters < ActiveRecord::Migration[7.0]
  def change
    create_table :film_screenwriters do |t|
      t.belongs_to :film, null: false, foreign_key: true
      t.belongs_to :screenwriter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
