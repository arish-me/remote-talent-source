# frozen_string_literal: true

class Job < ApplicationRecord
  validates_length_of :title, in: 10..50

  belongs_to :user
  belongs_to :company
  belongs_to :country
  has_one :company_role, dependent: :destroy
  has_one :role_type, through: :company_role
  has_one :preferred_location, as: :locatable
  has_one :salary, as: :salable
  accepts_nested_attributes_for :company_role, allow_destroy: true
  accepts_nested_attributes_for :preferred_location, allow_destroy: true
  accepts_nested_attributes_for :salary, allow_destroy: true

  has_rich_text :description
end
