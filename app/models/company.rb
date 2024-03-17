# frozen_string_literal: true

class Company < ApplicationRecord
  include Avatarable
  belongs_to :user
  validates_length_of :name, in: 3..30

  FORBIDDEN_EMAIL_DOMAINS = %w[gmail.com hotmail.com yahoo.com].freeze

  validates :company_email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ },
                            exclusion: { in: FORBIDDEN_EMAIL_DOMAINS, message: 'is not allowed' }
  validates :size, :bio, presence: true
  after_create :update_role
  after_create :activate_user

  COMPANY_SIZE = {
    1 => '1-5',
    2 => '10-25',
    3 => '25-50',
    4 => '50-100',
    5 => 'More than 100'
  }.freeze

  private

  def update_role
    user.update_without_password(role: 'company')
  end

  def activate_user
    user.activate!
  end
end
