# frozen_string_literal: true

class LocationType < ApplicationRecord
  has_many :preferred_locations

  scope :job_locations, lambda {
    joins(:preferred_locations).where(preferred_locations: { locatable_type: 'Job' })
  }
end
