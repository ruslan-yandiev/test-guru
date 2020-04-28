# frozen_string_literal: true

class BadgeService < Rule
  def initialize(test_passage)
    super(test_passage)
  end

  def reward
    return unless @test_passage.success?

    Badge.all.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule}".to_sym, badge.rule_value)
    end
  end
end
