# frozen_string_literal: true

class User < ApplicationRecord
  validates :login, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 5 }
end
