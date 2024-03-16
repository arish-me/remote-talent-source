# frozen_string_literal: true

class EmployeeLevel < ApplicationRecord
  belongs_to :employee
  belongs_to :role_level
end
