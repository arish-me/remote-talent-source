# frozen_string_literal: true

module Jobs
  class QuerySortButtonComponent < ApplicationComponent
    attr_reader :query, :user, :form_id, :scope

    delegate :sort, :search_query, to: :query

    def initialize(query:, user:, form_id:, scope: nil)
      @query = query
      @user = user
      @form_id = form_id
      @scope = scope
    end
  end
end
