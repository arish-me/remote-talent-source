# frozen_string_literal: true

class Employee < ApplicationRecord
  include Avatarable
  include Employees::HasOnlineProfiles
  # include Employees::RichText
  include PgSearch::Model
  validates_length_of :first_name, :last_name, in: 3..30

  validates_length_of :heading, in: 0..200
  # validates :open_roles, presence: true
  validates :employee_roles, presence: true
  validates :employee_levels, presence: true
  validate :bio_minimum_length

  after_create :update_role
  after_create :activate_user

  belongs_to :primary_role
  belongs_to :user, dependent: :destroy

  has_many :open_roles, dependent: :destroy
  has_many :primary_roles, through: :open_roles

  has_many :categories, through: :primary_roles

  has_many :employee_roles, dependent: :destroy
  has_many :role_types, through: :employee_roles

  has_many :employee_levels, dependent: :destroy
  has_many :role_levels, through: :employee_levels

  has_one :social_link, as: :sociable, dependent: :destroy
  has_one :location, as: :locatable, dependent: :destroy

  has_many :skillables, as: :skillable
  has_many :skills, through: :skillables

  accepts_nested_attributes_for :open_roles, allow_destroy: true
  accepts_nested_attributes_for :employee_roles, allow_destroy: true
  accepts_nested_attributes_for :employee_levels, allow_destroy: true
  accepts_nested_attributes_for :social_link, allow_destroy: true
  accepts_nested_attributes_for :location, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true

  scope :filter_by_role_levels, lambda { |role_levels|
    joins(:employee_levels).where(employee_levels: { role_level_id: role_levels })
  }

  scope :filter_by_role_types, lambda { |role_types|
    joins(:employee_roles).where(employee_roles: { role_type_id: role_types })
  }

  scope :filter_by_countries, lambda { |countries|
    joins(:location).where(locations: { country: countries })
  }

  scope :filter_by_categories, lambda { |categories|
    joins(:categories).where(categories: { id: categories })
  }

  scope :filter_by_utc_offsets, lambda { |utc_offsets|
    joins(:location).where(locations: { utc_offset: utc_offsets })
  }

  scope :newest_first, -> { order(created_at: :desc) }
  scope :recently_updated_first, -> { order(updated_at: :desc) }

  pg_search_scope :filter_by_search_query, against: %i[bio heading]

  enum search_status: %i[ready_to_interview open_to_offers closed_to_offers not_interested invisible]
  has_rich_text :bio

  def name
    "#{first_name} #{last_name}"
  end

  private

  def bio_minimum_length
    return unless bio.body.present? && bio.body.to_plain_text.length < 200

    errors.add(:bio, 'must be at least 200 characters long')
  end

  EXPERIENCE = {
    '< 1 Year' => 0,
    '1 Years' => 1,
    '2 Years' => 2,
    '3 Years' => 3,
    '4 Years' => 4,
    '5 Years' => 5,
    '6 Years' => 6,
    '7 Years' => 7,
    '8 Years' => 8,
    '9 Years' => 9,
    '10+ Years' => 10
  }.freeze

  def update_role
    user.update_without_password(role: 'employee')
  end

  def activate_user
    user.activate!
  end
end
