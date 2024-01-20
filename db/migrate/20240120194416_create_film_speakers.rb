# frozen_string_literal: true

class CreateFilmSpeakers < ActiveRecord::Migration[7.0]
  def change
    create_table :film_speakers do |t|
      t.belongs_to :film, null: false, foreign_key: true
      t.belongs_to :speaker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
