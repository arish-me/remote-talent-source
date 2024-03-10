# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :primary_role
  belongs_to :user
  validates_length_of :first_name, :last_name, in: 3..30
  after_create :update_role
  after_create :activate_user

  private

  def update_role
    user.update_without_password(role: 'employee')
  end

  def activate_user
    user.activate!
  end
end
