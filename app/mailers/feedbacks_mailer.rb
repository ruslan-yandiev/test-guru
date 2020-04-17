# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback, user_email)
    @feedback = feedback
    @current_user_email = user_email
    mail to: 'sqwer1986@gmail.com'
  end
end