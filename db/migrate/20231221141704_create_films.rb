# frozen_string_literal: true

class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :film_name, null: false
      t.text :film_description, null: false
      t.date :release_date, null: false
      t.string :film_url, null: false
      t.string :picture_url, null: false

      t.timestamps
    end
  end
end
