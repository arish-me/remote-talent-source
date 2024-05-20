# frozen_string_literal: true

class Conversation < ApplicationRecord
  belongs_to :employee
  belongs_to :company
  has_many :messages, -> { order(:created_at) }, dependent: :destroy

  validates_uniqueness_of :employee, scope: :company

  # after_create_commit { broadcast_append_to 'conversations' }

  def deleted_business_or_developer?
    employee.nil? || company.nil?
  end

  def other_recipient(user)
    employee == user.employee ? company_recipient : employee_recipient
  end

  def company_recipient
    {
      name: company.name,
      heading: company.tagline,
      object: company
    }
  end

  def employee_recipient
    {
      name: employee.name,
      heading: employee.heading,
      object: employee
    }
  end

  def business?(user)
    company == user.company
  end

  def developer?(user)
    employee == user.employee
  end
end
