# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru <sqwer1986@gmail.com>")
  layout 'mailer'
end
