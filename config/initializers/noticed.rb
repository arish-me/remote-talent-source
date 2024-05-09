# frozen_string_literal: true

# config/initializers/noticed.rb
module NotificationExtensions
  extend ActiveSupport::Concern
end

Rails.application.config.to_prepare do
  Noticed::Notification.include NotificationExtensions
end
