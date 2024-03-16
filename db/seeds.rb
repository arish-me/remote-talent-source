# frozen_string_literal: true

PRIMARY_ROLES = %w[
  software_engineer
  mobile_developer
  android_developer
  ios_developer
  frontend_engineer
  backend_engineer
  fullstack_engineer
  software_architect
  ai_engineer
].freeze

PRIMARY_ROLES.each do |role_name|
  PrimaryRole.find_or_create_by(name: role_name)
end
