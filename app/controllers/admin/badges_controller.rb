# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: :index 

  def index; end

  private

 def set_badges
   @badges = Badge.all
 end
end