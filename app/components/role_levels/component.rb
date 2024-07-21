# frozen_string_literal: true

module RoleLevels
  class Component < ApplicationComponent
    attr_reader :role_levels

    def initialize(role_levels)
      @role_levels = role_levels
    end

    def render?
      role_levels
    end

    # def role_level_types
    #   RoleLevel::TYPES
    # end

    # def humanize(attribute)
    #   # i18n-tasks-use t('activerecord.attributes.role_level.c_level')
    #   # i18n-tasks-use t('activerecord.attributes.role_level.junior')
    #   # i18n-tasks-use t('activerecord.attributes.role_level.mid')
    #   # i18n-tasks-use t('activerecord.attributes.role_level.principal')
    #   # i18n-tasks-use t('activerecord.attributes.role_level.senior')
    #   RoleLevel.human_attribute_name(attribute)
    # end

    # private

    # def selected_role_levels
    #   role_level_types.select do |role_level_type|
    #     role_level.public_send("#{role_level_type}?")
    #   end
    # end
  end
end
