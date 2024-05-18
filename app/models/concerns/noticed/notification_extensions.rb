# frozen_string_literal: true

# app/models/concerns/noticed/notification_extensions.rb
module Noticed
  # app/models/concerns/noticed/notification_extensions.rb
  module NotificationExtensions
    extend ActiveSupport::Concern

    def broadcast_update_to_bell
      broadcast_replace_to(
        recipient, # we add this because stream to user
        "notifications_bell_#{recipient.id}",
        target: 'notification_bell',
        partial: 'shared/navs/notification_bell',
        locals: { unread: recipient.reload.notifications.unread.any? }
      )
    end

    def broadcast_replace_to_index_count
      broadcast_replace_to(
        recipient, # we add this because stream to user
        "notifications_index_#{recipient.id}",
        target: 'notification_index_count',
        partial: 'notifications/notifications_count',
        locals: { unread: recipient.reload.notifications.unread.count }
      )
    end

    def broadcast_prepend_to_index_list
      broadcast_prepend_to(
        recipient, # we add this because stream to user
        "notifications_index_list_#{recipient.id}",
        target: 'notifications',
        partial: 'notifications/notification',
        locals: { notification: self }
      )
    end

    def broadcast_prepend_to_header_list
      broadcast_prepend_to(
        recipient, # we add this because stream to user
        "notifications_header_list_#{recipient.id}",
        target: 'notifications_header',
        partial: 'shared/navs/header_notification',
        locals: { notification: self, header: true }
      )
    end
  end
end
