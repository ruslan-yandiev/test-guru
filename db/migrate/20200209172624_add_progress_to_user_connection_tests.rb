class AddProgressToUserConnectionTests < ActiveRecord::Migration[6.0]
  def change
    add_column :user_connection_tests, :progress, :integer, default: 0
  end
end
