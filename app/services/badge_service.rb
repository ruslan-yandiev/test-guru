# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def reward
    return unless @test_passage.success?

    @badges = Badge.all
    
    @badges.each do |badge|
      @user.badges.push(badge) if send(badge.rule, badge.rule_value)
    end
  end
end