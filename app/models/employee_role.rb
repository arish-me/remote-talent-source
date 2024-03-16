class EmployeeRole < ApplicationRecord
  belongs_to :employee
  belongs_to :role_type
end
