# frozen_string_literal: true

class CreateFilmDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :film_directors do |t|
      t.belongs_to :film, null: false, foreign_key: true
      t.belongs_to :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
