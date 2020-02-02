# frozen_string_literal: true

class AddCorrectToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, index: true, null: false, foreign_key: true
  end
end