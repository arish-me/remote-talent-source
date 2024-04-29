# frozen_string_literal: true

class CompanyRole < ApplicationRecord
  belongs_to :job
  belongs_to :company
  belongs_to :role_type
end
