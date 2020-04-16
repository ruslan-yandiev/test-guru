# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback

    mail to: 'sqwer1986@gmail.com'
  end
end