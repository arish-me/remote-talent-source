# frozen_string_literal: true

module Jobs
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
        :search_query,
        { role_types: [],
          preferred_locations: [],
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
