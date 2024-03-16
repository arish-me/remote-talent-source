# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :primary_role
  belongs_to :user
  validates_length_of :first_name, :last_name, in: 3..30
  after_create :update_role
  after_create :activate_user
  has_many :open_roles
  #has_many :primary_roles, through: :open_roles

  accepts_nested_attributes_for :open_roles, allow_destroy: true, update_only: true

  private

  EXPERIENCE = [
    '< 1 Year',
    '1 Year',
    '2 Year',
    '3 Year',
    '4 Year',
    '5 Year',
    '6 Year ',
    '7 Year',
    '8 Year',
    '9 Year',
    '10+ Year',
  ].freeze

  def update_role
    user.update_without_password(role: 'employee')
  end

  def activate_user
    user.activate!
  end
end
