# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :name, :rule, presence: true, length: { in: 3..300 }
  validates_uniqueness_of :rule, scope: :rule_value, case_sensitive: false
  validates :rule, inclusion: { in: Rule::ALL_BADGES_RULES, message: "%{value} is not a valid rule" }

end
