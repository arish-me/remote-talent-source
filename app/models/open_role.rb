# frozen_string_literal: true

class OpenRole < ApplicationRecord
  belongs_to :employee
  belongs_to :primary_role
end
