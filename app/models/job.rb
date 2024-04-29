# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_one :company_role, dependent: :destroy
  has_one :role_type, through: :company_role
  has_one :preferred_location, as: :locatable
  accepts_nested_attributes_for :company_role, allow_destroy: true
  accepts_nested_attributes_for :preferred_location, allow_destroy: true
end
