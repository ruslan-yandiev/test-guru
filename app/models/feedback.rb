# frozen_string_literal: true

class Feedback
  include ActiveModel::Model

  attr_accessor :email, :text

  def id
    nil
  end

  validates :text, length: { in: 3..255 }
  validates :email, presence: true
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
end
