# frozen_string_literal: true

class Rule

  ALL_BADGES_RULES = %w[first_try? all_level? all_category?]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def first_try?(_unused)
  	return unless @test_passage.success?

    passages = TestPassage.where(
      test_id: @test_passage.test_id,
      user_id: @test_passage.user_id
    ).count

    passages == 1
  end

  def all_category?(badge)
  	return if @test_passage.test.category.title != badge.rule_value
  	return unless @test_passage.success?

  	    (
      Test.sort_names_by_category(badge.rule_value).pluck(:id) -
      new_passages(last_badge_date(:all_category?, badge)).ids
    ).empty?
  end

  def all_level?(badge)
  	return if @test_passage.test.level != badge.rule_value.to_i
  	return unless @test_passage.success?

	    (
      Test.level(badge.rule_value).pluck(:id) -
      new_passages(last_badge_date(:all_level?, badge)).ids
    ).empty?
  end

  def last_badge_date(rule, badge)
    badge.badges_users.where(user: @user).order(:created_at).last.try(:created_at)
  end

  def new_passages(last_date)
    return @user.success_tests if last_date.nil?
    @user.success_tests.where('test_passages.created_at > ?', last_date)
  end
end
