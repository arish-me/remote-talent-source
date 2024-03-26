# frozen_string_literal: true

module Locations
  class Component < ApplicationComponent
    def initialize(location)
      @full_address = location.full_address
    end

    def render?
      @full_address.present?
    end

    def location
      @full_address
    end
  end
end
