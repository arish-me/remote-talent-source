# frozen_string_literal: true

module Admin
  # services/admin/admin_service.rb
  class AdminService
    attr_reader :email

    def initialize(email = nil)
      @email = email || 'support@remotetalentsource.com'
    end

    def call
      create_admin
    end

    def create_admin
      User.find_or_create_by!(email:) do |user|
        user.assign_attributes(attributes)
      end
    end

    def attributes
      {
        email:,
        password: Rails.env.development? ? 'support@remotetalentsource.com' : 'Password123!',
        password_confirmation: Rails.env.development? ? 'support@remotetalentsource.com' : 'Password123!',
        confirmed_at: DateTime.current,
        role: 3,
        current_state: 'active'
      }
    end
  end
end
