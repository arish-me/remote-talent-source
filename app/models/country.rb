# frozen_string_literal: true

class Country < ApplicationRecord
  belongs_to :currency
  has_many :jobs
end
