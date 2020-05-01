# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }, subject: -> { t('.subject') }

  def send_feedback(feedback)
    @body = feedback.text
    @author = feedback.email
    mail
  end
end
