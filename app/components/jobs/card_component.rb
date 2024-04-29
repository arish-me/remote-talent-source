# frozen_string_literal: true

module Jobs
  class CardComponent < ApplicationComponent
    include JobsHelper
    with_collection_parameter :job

    def initialize(job:, highlight_featured: false)
      @job = job
    end

    def hero
      job.title
    end

    def description
      job.description
    end

    def highlight?
      false
    end

    def role_type
      job.role_type.name.humanize
    end

    def preferred_location
      job.preferred_location.location_type.name.capitalize
    end

    def countries(limit = 4)
      words = job.countries.pluck(:name).take(limit)
      truncated_countries = words.join(', ')
      truncated_countries += '...' if job.countries.count > limit
      truncated_countries
    end

    def time_ago
      time_ago_in_words(job.created_at).gsub('about ', '')
    end

    private

    attr_reader :job, :highlight_featured
  end
end
