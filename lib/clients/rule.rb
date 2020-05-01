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

  def all_category?(category_name)
  	return if @test_passage.test.category.title != category_name
  	return unless @test_passage.success?

  	    (
      Test.sort_names_by_category(category_name).pluck(:id) -
      new_passages(last_badge_date(:all_category?, category_name)).ids
    ).empty?
  end

  def all_level?(level_number)
  	return if @test_passage.test.level != level_number.to_i
  	return unless @test_passage.success?

	    (
      Test.level(level_number).pluck(:id) -
      new_passages(last_badge_date(:all_level?, level_number)).ids
    ).empty?
  end

  def cleaning
  	$ids_collection.clear
  end

  def last_badge_date(rule, rule_value)
    @user.badges_users.joins(:badge).where(badges: { rule: rule, rule_value: rule_value }).order(:created_at).last.try(:created_at)
  end

  def new_passages(last_date)
    return @user.success_tests if last_date.nil?
    @user.success_tests.where('test_passages.created_at > ?', last_date)
  end
end
