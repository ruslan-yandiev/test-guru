# frozen_string_literal: true

class Feedbacks < ActiveRecord::Migration[6.0]
  create_table :feedbacks do |t|
    t.text :body, null: false
    t.references :user, foreign_key: true
  end
end
