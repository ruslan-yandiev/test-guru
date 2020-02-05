class AddAuthorToTest < ActiveRecord::Migration[6.0]
  def change
  	add_reference :tests, :author, type: :integer, foreign_key: { to_table: :users}, index: true
  end
end
