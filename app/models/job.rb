# frozen_string_literal: true

# app/modes/job.rb
class Job < ApplicationRecord
  include AASM

  enum apply_type: { custom_ats: 0, remote_talent_ATS: 1 }
  has_rich_text :description

  validates_length_of :title, in: 10..50
  # validates :apply_url, presence: true, if: :custom_ats?
  validates_presence_of :description

  belongs_to :user
  belongs_to :company
  has_one :company_role, dependent: :destroy
  has_one :role_type, through: :company_role
  has_one :preferred_location, as: :locatable
  has_one :salary, as: :salable
  has_many :job_countries, dependent: :destroy
  has_many :countries, through: :job_countries

  accepts_nested_attributes_for :company_role, allow_destroy: true
  accepts_nested_attributes_for :preferred_location, allow_destroy: true
  accepts_nested_attributes_for :salary, allow_destroy: true
  accepts_nested_attributes_for :job_countries, allow_destroy: true

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
