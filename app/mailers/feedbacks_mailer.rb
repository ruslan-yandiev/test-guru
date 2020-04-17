# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }, subject: -> { t('.subject') }

  def send_feedback(feedback, user_email)
    @feedback = feedback
    @current_user_email = user_email
    mail
  end
end
