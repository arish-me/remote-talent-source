# frozen_string_literal: true

module RoleTypes
  class Component < ApplicationComponent
    attr_reader :role_types

    def initialize(role_types)
      @role_types = role_types
    end

    def render?
      role_types
    end

    # def role_types
    #   employee.role_types
    # end

    def humanize(attribute)
      RoleType.human_attribute_name(attribute)
    end

    private

    # def selected_role_types
    #   role_types.select do |rt|
    #     role_type.public_send("#{rt}?")
    #   end
    # end
  end
end
