# frozen_string_literal: true

class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :director_fio, null: false

      t.timestamps
    end
  end
end
