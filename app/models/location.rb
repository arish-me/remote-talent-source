# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true, inverse_of: :locatable
  validates :address, presence: true
  validate :valid_address_format

  before_save :handle_timezone

  scope :top_countries, lambda { |limit = ENV.fetch('TOP_COUNTRIES', 5)|
    group(:country)
      .where.not(country: nil)
      .order('count_all DESC')
      .limit(limit)
      .count
      .keys
  }

  scope :top_utc_offsets, lambda { |limit = ENV.fetch('TOP_UTC_OFFSETS', 5)|
    group(:utc_offset)
      .where.not(utc_offset: nil)
      .order('count_all DESC')
      .limit(limit)
      .count
      .keys
  }
  def full_address
    [city, state, country].compact.join(', ')
  end

  def handle_timezone
    self.time_zone = TimezoneFinder.create.timezone_at(lat: latitude.to_d, lng: longitude.to_d)
    self.utc_offset = ActiveSupport::TimeZone.new(time_zone).utc_offset
  end

  private

  def valid_address_format
    if address.present? && country.present? && city.present? && state.present? && latitude.present? && longitude.present?
      return
    end

    errors.add(:address, :invalid_address_format)
  end
end
