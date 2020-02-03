# frozen_string_literal: true

class AddCorrectToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean, default: false
    change_column_null(:answers, :correct, false)
    add_reference :answers, :question, index: true, null: false, foreign_key: true
  end
end
