# frozen_string_literal: true

Admin::AdminService.new.call
Admin::GlobalService.new.call
Admin::EmployeeService.new(5).call
Admin::CompanyService.new(5).call

LOCATION_TYPE = %w[
  remote
  hybrid
  onsite
].freeze

LOCATION_TYPE.each do |location_type|
  LocationType.find_or_create_by(name: location_type)
end
