class RoleLevel < ApplicationRecord
  has_many :employee_levels
  has_many :employees, through: :employee_levels
end
