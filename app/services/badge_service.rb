# frozen_string_literal: true

class BadgeService < Rule

  def initialize(test_passage)
    super(test_passage)
  end

  def reward
    Badge.all.select do |badge|
      badge if send("#{badge.rule}".to_sym, badge.rule_value)
    end
  end
end
