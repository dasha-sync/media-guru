# frozen_string_literal: true

class CreateFilmCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :film_countries do |t|
      t.belongs_to :film, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
