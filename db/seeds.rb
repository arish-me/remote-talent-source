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

ROLE_TYPES = %w[
  part_time_contract
  full_time_contract
  full_time_employment
].freeze

ROLE_LEVEL = %w[
  junior
  mid
  senior
  principal
  c_level
].freeze

ROLE_TYPES.each do |role_type|
  RoleType.find_or_create_by(name: role_type)
end

ROLE_LEVEL.each do |role_type|
  RoleLevel.find_or_create_by(name: role_type)
end

PRIMARY_ROLES.each do |role_name|
  PrimaryRole.find_or_create_by(name: role_name)
end

@seed = false
50.times.each { SeedsHelper.create_developer! } if @seed


email = "admin@example.com"
attributes = {
  email:,
  password: "admin@example.com",
  password_confirmation: "admin@example.com",
  confirmed_at: DateTime.current,
  role: 3,
  current_state: 'active'
}

User.find_or_create_by!(email:) do |user|
  user.assign_attributes(attributes)
end

