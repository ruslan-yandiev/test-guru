# frozen_string_literal: true

class BadgeService < Rule
  def initialize(test_passage)
    super(test_passage)
  end

  def reward
    return unless @test_passage.success?

    @badges = Badge.all

    @badges.each do |badge|
      @user.badges.push(badge) if send(badge.rule, badge.rule_value)
    end
  end
end
