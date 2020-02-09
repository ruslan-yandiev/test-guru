# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_connection_tests, dependent: :destroy
  has_many :tests, through: :user_connection_tests
  has_many :existing_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 5 }

  # def tests_list(value_level)
  # 	Test.joins("JOIN user_connection_tests ON tests.id = user_connection_tests.test_id")
  # 	.where(level: value_level, user_connection_tests: { user_id: id })
  # end

  def tests_list(value_level)
  	tests.where(level: value_level)
  end
end
