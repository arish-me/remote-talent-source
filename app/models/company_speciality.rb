# frozen_string_literal: true

class CompanySpeciality < ApplicationRecord
  belongs_to :company
  belongs_to :speciality
end
