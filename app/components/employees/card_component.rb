module Employees
  class CardComponent < ApplicationComponent
    with_collection_parameter :employee

    private attr_reader :employee, :highlight_featured

    def initialize(employee:, highlight_featured: false)
      @employee = employee
    end

    def hero
      employee.heading
    end

    def bio
      employee.bio
    end

    def highlight?
      false
    end
  end
end
