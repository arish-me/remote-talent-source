# frozen_string_literal: true

module DeliveryMethods
  class TurboStream < ApplicationDeliveryMethod
    # Specify the config options your delivery method requires in its config block
    # required_options #:day # :foo, :bar

    def deliver
      return unless recipient.is_a?(User)

      # notification.broadcast_update_to_bell
      notification.broadcast_prepend_to_header_list
      notification.broadcast_replace_to_index_count
      notification.broadcast_prepend_to_index_list
      notification.broadcast_prepend_to_header_list
    end
  end
end
