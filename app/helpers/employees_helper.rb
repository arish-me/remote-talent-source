# frozen_string_literal: true

module EmployeesHelper
  def primary_roles_grouped
    categories = Category.includes(:primary_roles)
    grouped_options = []

    categories.each do |category|
      primary_roles = category.primary_roles.map { |role| { value: role.id, label: role.name.titleize } }

      grouped_options << { label: category.name.titleize, choices: primary_roles }
    end
    grouped_options.map do |category|
      [category[:label], category[:choices].map { |choice| [choice[:label], choice[:value]] }]
    end
  end
end
