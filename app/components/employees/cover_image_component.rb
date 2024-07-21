# frozen_string_literal: true

module Employees
  class CoverImageComponent < ViewComponent::Base
    DEFAULT_COVER = 'default_splash.jpg'

    attr_reader :employee, :data, :classes

    def initialize(employee:, data: {}, classes: '')
      @employee = employee
      @data = data
      @classes = classes
    end

    def cover_image_url
      return image_path(DEFAULT_COVER) unless employee.cover_image.attached?

      url_for employee.cover_image
    end
  end
end
