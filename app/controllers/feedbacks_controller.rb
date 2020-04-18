# frozen_string_literal: true

class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid? && FeedbackMailer.send_feedback(@feedback).deliver_now
      flash[:notice] = t('.success')
      redirect_to feedback_index_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :author)
  end
end
