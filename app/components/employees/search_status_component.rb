# frozen_string_literal: true

module Employees
  class SearchStatusComponent < ApplicationComponent
    attr_reader :query, :user, :form_id, :scope

    delegate :sort, :search_query, to: :query

    def initialize(employee:)
      @employee = employee
    end

    def icon_class
      case @employee.search_status
      when 'open_to_offers'
        'fas fa-check-circle text-success'
      when 'ready_to_interview'
        'fas fa-check-circle text-success'
      when 'not_interested'
        'fas fa-times-circle text-danger'
      when 'inactive'
        'fas fa-times-circle text-danger'
      when 'closed_to_offers'
        'fas fa-times-circle text-danger'
      when 'invisible'
        'fas fa-times-circle text-grey'
      else
        'fas fa-question-circle text-secondary'
      end
    end

    def status_class
      case @employee.search_status
      when 'open_to_offers'
        'text-success'
      when 'ready_to_interview'
        'text-success'
      when 'not_interested'
        'text-danger'
      when 'inactive'
        'text-grey'
      when 'closed_to_offers'
        'text-danger'
      else
        'text-secondary'
      end
    end

    def status_text
      @employee.search_status.humanize
    end
  end
end
