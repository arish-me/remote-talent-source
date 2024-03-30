# frozen_string_literal: true

module Employees
  class QueryPolicy < ApplicationPolicy
    def permitted_attributes
      default_attributes
    end

    private

    def default_attributes
      [
        :page,
        :include_not_interested,
        :sort,
        { role_levels: [],
          role_types: [],
          badges: [],
          utc_offsets: [],
          countries: [] }
      ]
    end

    def paywalled_attributes
      [
        :search_query,
        { specialty_ids: [] }
      ]
    end
  end
end
