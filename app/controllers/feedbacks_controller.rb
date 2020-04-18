# frozen_string_literal: true

class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid? && FeedbacksMailer.send_feedback(@feedback).deliver_now
      flash[:notice] = t('.success')
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.permit(:text, :email)
  end
end
