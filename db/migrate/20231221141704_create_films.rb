# frozen_string_literal: true

class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :film_name, null: false
      t.text :film_description
      t.date :release_date
      t.string :film_link
      t.string :image_link

      t.timestamps
    end
  end
end
