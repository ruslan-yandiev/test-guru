# frozen_string_literal: true

class Feedback
  include ActiveModel::Model

  attr_accessor :author, :body

  def id
    nil
  end

  validates :author, :body, presence: true
  validates_format_of :author, with: /\A[^@]+@[^@]+[\.a-zA-Z0-9]\z/i
end
