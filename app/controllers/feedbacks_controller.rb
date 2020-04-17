# frozen_string_literal: true

class FeedbacksController < ApplicationController

  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user_id = current_user.id

    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback.body).deliver_now
      redirect_to tests_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end