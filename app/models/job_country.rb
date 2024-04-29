# frozen_string_literal: true

class JobCountry < ApplicationRecord
  belongs_to :job
  belongs_to :country
end
