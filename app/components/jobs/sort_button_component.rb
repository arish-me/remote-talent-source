# frozen_string_literal: true
module Jobs
  class SortButtonComponent < ApplicationComponent
    attr_reader :title, :sort_type

    def initialize(title:, name:, sort_type:, active:)
      @title = title
      @name = name
      @sort_type = sort_type
      @active = active
    end

    def name
      if @scope.present?
        "#{@scope}[#{@name}]"
      else
        @name
      end
    end

    def active?
      !!@active
    end

    def active_class
      active? ? 'active' : ''
    end
  end
end