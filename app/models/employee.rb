# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :primary_role
  validates_length_of :first_name, :last_name, in: 3..30
end
