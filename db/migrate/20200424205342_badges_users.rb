# frozen_string_literal: true

class BadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table 'badges_users' do |t|
      t.integer :user_id, null: false
      t.integer :badge_id, null: false
      t.timestamps
    end
  end
end
