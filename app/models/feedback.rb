# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 5..355 }
end