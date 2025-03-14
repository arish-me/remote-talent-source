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

puts 'Importing currencies...'
system('bundle exec rake import:currencies')
puts 'Currencies imported successfully!'

puts 'Importing countries...'
system('bundle exec rake import:countries')
puts 'Countries imported successfully!'

# Admin::JobService.new(2).call
# Admin::JobBoardService.new.call
