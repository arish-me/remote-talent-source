# frozen_string_literal: true

Admin::AdminService.new.call
Admin::GlobalService.new.call
Admin::EmployeeService.new(5).call
Admin::CompanyService.new(5).call
# RAILS_ENV=develoment bundle exec rails console
