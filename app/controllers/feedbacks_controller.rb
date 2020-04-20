# frozen_string_literal: true

class FeedbacksController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid? && FeedbacksMailer.send_feedback(@feedback).deliver_now
      flash[:notice] = t('.success')
      redirect_to new_feedback_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.permit(:text, :email)
  end
end
