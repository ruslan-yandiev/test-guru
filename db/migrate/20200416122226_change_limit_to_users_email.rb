# frozen_string_literal: true

class ChangeLimitToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string, limit: nil
  end
end
