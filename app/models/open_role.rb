# frozen_string_literal: true

class OpenRole < ApplicationRecord
  belongs_to :employee
  belongs_to :primary_role

  validates :employee_id, presence: true
  validates :primary_role_id, presence: true
end
