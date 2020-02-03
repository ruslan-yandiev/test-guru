# frozen_string_literal: true

class User < ApplicationRecord
  validates :login, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 5 }

  def tests_list(value_level)
  	Test.joins("JOIN user_connection_tests ON tests.id = user_connection_tests.test_id")
  	.where(level: value_level, user_connection_tests: { user_id: id })
  end
end
