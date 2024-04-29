# frozen_string_literal: true

module Admin
  class JobService
    attr_reader :count

    def initialize(count = 1)
      @count = count
    end

    def call
      create_job
    end

    def create_job
      count.times.each { SeedsHelper.create_jobs! }
    end
  end
end
