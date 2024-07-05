# frozen_string_literal: true

module Jobs
  class QueryComponent < ApplicationComponent
    attr_reader :query, :user, :form_id

    delegate :sort, :search_query, to: :query

    def initialize(query:, user:, form_id:)
      @query = query
      @user = user
      @form_id = form_id
    end

    def role_types
      RoleType.all.map { |role| [role.id, role.name.titleize] }
    end

    def preferred_locations
      LocationType.all.map { |type| [type.id, type.name.titleize] }
    end

    def countries
      JobCountry.includes(:country).map { |object| [object.country.name.titleize, object.country.id] }.uniq
    end

    def role_type_selected?(role_type_pair)
      query.role_types.map(&:to_s).include?(role_type_pair.first)
    end

    def location_type_selected?(location_type_pair)
      query.preferred_locations.map(&:to_s).include?(location_type_pair.first)
    end
  end
end
