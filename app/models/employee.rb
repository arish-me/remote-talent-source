# frozen_string_literal: true

class Employee < ApplicationRecord
  include Avatarable
  include Employees::RichText
  validates_length_of :first_name, :last_name, in: 3..30

  validates_length_of :heading, in: 0..200
  # validates :open_roles, presence: true
  validates :employee_roles, presence: true
  validates :employee_levels, presence: true

  after_create :update_role
  after_create :activate_user

  belongs_to :primary_role
  belongs_to :user

  has_many :open_roles, dependent: :destroy
  has_many :primary_roles, through: :open_roles

  has_many :employee_roles, dependent: :destroy
  has_many :role_types, through: :employee_roles

  has_many :employee_levels, dependent: :destroy
  has_many :role_levels, through: :employee_levels

  has_one :social_link, as: :sociable, dependent: :destroy
  has_one :location, as: :locatable, dependent: :destroy

  accepts_nested_attributes_for :open_roles, allow_destroy: true
  accepts_nested_attributes_for :employee_roles, allow_destroy: true
  accepts_nested_attributes_for :employee_levels, allow_destroy: true
  accepts_nested_attributes_for :social_link, allow_destroy: true
  accepts_nested_attributes_for :location, allow_destroy: true

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
