# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'support@remotetalentsource.com'
  layout 'mailer'
end
