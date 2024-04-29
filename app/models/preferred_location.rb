# frozen_string_literal: true

# app/models/preferred_location.rb

class PreferredLocation < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :location_type

  # validates :locatable_type, presence: true
  # validates :locatable_id, presence: true
  # validates :location_type_id, presence: true
end
