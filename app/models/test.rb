class Test < ApplicationRecord
  has_many :questions # self.has_many(:questions)
   
  def self.sort_names_by_category(name_category)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: name_category })
  end
end
