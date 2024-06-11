# frozen_string_literal: true

class ConnectionRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :company

  validates :employee_id, uniqueness: { scope: :company_id }
  enum status: %i[open pending declined accepted]
end
