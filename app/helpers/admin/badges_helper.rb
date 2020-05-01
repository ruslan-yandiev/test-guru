 module Admin::BadgesHelper
  def badge_rule
    Rule::ALL_BADGES_RULES.map { |rule| [I18n.t(".rules.#{rule}"), rule]}
  end
end