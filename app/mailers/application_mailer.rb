# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'cool-net1986@mail.ru'
  layout 'mailer'
end
