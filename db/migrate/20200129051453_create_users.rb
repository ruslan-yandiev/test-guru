# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login, limit: 30
      t.string :password, limit: 30

      t.timestamps
    end
  end
end
