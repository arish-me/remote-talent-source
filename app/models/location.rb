# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :source, polymorphic: true
  validates :address, presence: true
  validate :valid_address_format

  def full_address
    [city, state, country].compact.join(', ')
  end

  private

  def valid_address_format
    return if address.present? && country.present? && city.present? && state.present? && latitude.present? && longitude.present?

    errors.add(:address, :invalid_address_format)
  end
end
