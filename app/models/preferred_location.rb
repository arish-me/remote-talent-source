# frozen_string_literal: true

# app/models/preferred_location.rb

class PreferredLocation < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :location_type
end
