# frozen_string_literal: true

class Employee < ApplicationRecord
  include Avatarable
  validates_length_of :first_name, :last_name, in: 3..30

  validates_length_of :heading, in: 3..30, on: :update

  after_create :update_role
  after_create :activate_user

  belongs_to :primary_role
  belongs_to :user

  has_many :open_roles
  has_many :employee_roles
  has_many :role_types, through: :employee_roles
  has_many :employee_levels
  has_many :role_level, through: :employee_levels

  has_one :social_link, as: :source


  accepts_nested_attributes_for :open_roles, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :employee_roles, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :employee_levels, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :social_link, update_only: true

  enum search_status: %i[actively_looking open not_interested invisible]

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
    '10+ Year'
  ].freeze

  def update_role
    user.update_without_password(role: 'employee')
  end

  def activate_user
    user.activate!
  end
end
