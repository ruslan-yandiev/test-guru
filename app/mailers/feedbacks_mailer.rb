# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }, subject: -> { t('.subject') }

  def send_feedback(feedback)
    @feedback = feedback.body
    @author = feedback.author
    mail
  end
end