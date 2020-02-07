class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :user_connection_tests, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :user_connection_tests
   
  # def self.sort_names_by_category(name_category)
  #   joins('JOIN categories ON categories.id = tests.category_id')
  #   .where(categories: { title: name_category })
  # end

  def self.sort_names_by_category(name_category)
    joins(:category).where(categories: { title: name_category })
  end
end
