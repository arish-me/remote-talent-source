# frozen_string_literal: true

module ApplicationHelper
  def profile_link
    if current_user.employee?
      edit_employee_path(current_user.employee)
    else
      edit_company_path(current_user.company)
    end
  end

  def role_level_selected?(object)
    @query.role_levels.map(&:to_s).include?(object.id)
  end

  def role_type_selected?(object)
    @query.role_types.map(&:to_s).include?(object.id)
  end

  def country_selected?(object)
    @query.countries.include?(object.first)
  end

  def utc_offset_selected?(object)
    @query.utc_offsets.include?(object.first)
  end

  def time_zones(utc_offsets)
    @time_zones ||= utc_offsets.map do |utc_offset|
      [utc_offset, render(UTCOffsets::Component.new(utc_offset))]
    end
  end
end
