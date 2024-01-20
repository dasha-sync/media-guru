# frozen_string_literal: true

class CreateScreenwriters < ActiveRecord::Migration[7.0]
  def change
    create_table :screenwriters do |t|
      t.string :screenwriter_fio, null: false

      t.timestamps
    end
  end
end
