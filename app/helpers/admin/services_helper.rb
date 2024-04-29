# frozen_string_literal: true

module Admin
  module ServicesHelper
    def action_humanize(name)
      %w[users employees companies jobs currencies countries].include?(name.to_s) ? 'Generate' : 'Delete'
    end
  end
end
