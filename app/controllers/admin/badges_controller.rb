# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: :index

  def index; end

  def new
  	@badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path(@badge)
    else
      render :new
    end
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def badge_params
  	params.require(:badge).permit(:name, :url, :rule)
  end
end
