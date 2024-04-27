# frozen_string_literal: true

module Admin
  class CompanyService
    attr_reader :count

    def initialize(count = 1)
      @count = count
    end

    def call
      create_company
    end

    def create_company
      count.times.each { SeedsHelper.create_company! }
    end
  end
end
