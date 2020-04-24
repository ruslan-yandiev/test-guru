class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, length: { in: 3..300 }
  validates :url,  presence: true, length: { in: 3..300 }
  validates :rule, presence: true, length: { in: 3..300 }
end
