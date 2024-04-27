# frozen_string_literal: true

module Admin
  class EmployeeService
    attr_reader :count

    def initialize(count = 1)
      @count = count
    end

    def call
      create_employee
    end

    def create_employee
      count.times.each { SeedsHelper.create_developer! }
    end
  end
end
