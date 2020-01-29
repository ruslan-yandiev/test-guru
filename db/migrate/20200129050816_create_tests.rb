# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
