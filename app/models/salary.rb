# frozen_string_literal: true

# app/models/salary.rb
class Salary < ApplicationRecord
  enum salary_type: { yearly: 0, monthly: 1, daily: 2, hourly: 3 }

  belongs_to :salable, polymorphic: true
  belongs_to :currency

  validate :validate_min_less_than_max

  private

  def validate_min_less_than_max
    return unless min.present? && max.present? && min >= max

    errors.add(:min, 'should be less than max')
    errors.add(:max, 'should be greater than min')
  end
end
