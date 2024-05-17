class Conversation < ApplicationRecord
  belongs_to :employee
  belongs_to :company
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :employee, scope: :company

  def deleted_business_or_developer?
    employee.nil? || company.nil?
  end

  def other_recipient(user)
    employee == user.employee ? company : employee
  end

  def business?(user)
    company == user.company
  end

  def developer?(user)
    employee == user.employee
  end
end
