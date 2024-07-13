# frozen_string_literal: true

# app/modes/job.rb
class Job < ApplicationRecord
  extend FriendlyId
  include AASM
  include PgSearch::Model
  enum apply_type: { custom_ats: 0, remote_talent_ATS: 1 }
  enum job_type: { talentsource: 0, job_board: 1 }

  has_rich_text :description

  validates_length_of :title, in: 10..50
  # validates :apply_url, presence: true, if: :custom_ats?
  validates_presence_of :description

  belongs_to :job_board, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  has_one :company_role, dependent: :destroy
  has_one :role_type, through: :company_role
  has_one :preferred_location, as: :locatable
  has_one :location_type, through: :preferred_location
  has_one :salary, as: :salable
  has_many :job_countries, dependent: :destroy
  has_many :countries, through: :job_countries

  accepts_nested_attributes_for :company_role, allow_destroy: true
  accepts_nested_attributes_for :preferred_location, allow_destroy: true
  accepts_nested_attributes_for :salary, allow_destroy: true
  accepts_nested_attributes_for :job_countries, allow_destroy: true

  acts_as_taggable_on :tags

  friendly_id :slug, use: :slugged

  aasm column: 'current_state' do
    state :pending, initial: true
    state :active
    state :inactive

    event :activate do
      transitions from: %i[pending inactive], to: :active
    end

    event :deactivate do
      transitions from: %i[active], to: :inactive
    end
  end

  scope :filter_by_role_types, lambda { |role_types|
    joins(:company_role).where(company_role: { role_type_id: role_types })
  }

  scope :filter_by_preferred_location, lambda { |location_type|
    joins(:preferred_location).where(preferred_location: { location_type_id: location_type })
  }

  scope :filter_by_countries, lambda { |country|
    joins(:job_countries).where(job_countries: { country: })
  }

  scope :newest_first, -> { order(created_at: :desc) }
  scope :recently_updated_first, -> { order(updated_at: :desc) }

  pg_search_scope :filter_by_search_query, against: [:title],
                                           associated_against: { company: :name, rich_text_description: [:body] }

  def set_job_status
    case current_state
    when 'pending'
      activate!
    when 'inactive'
      activate!
    when 'active'
      deactivate!
    end
  end

  private

  def custom_ats?
    apply_type == 'custom_ats'
  end
end
