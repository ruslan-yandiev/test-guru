# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.text :name, null: false
      t.text :url, null: false
      t.text :rule, null: false
      t.text :rule_value
      t.timestamps
    end

    add_index :badges, :name, unique: true
  end
end
