class DropTableFeedbacks < ActiveRecord::Migration[6.0]
  def up
  	drop_table :feedbacks, if_exists: true
  end
end
