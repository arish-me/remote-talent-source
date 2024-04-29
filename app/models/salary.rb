# frozen_string_literal: true

# app/models/salary.rb
class Salary < ApplicationRecord
  enum salary_type: { yearly: 0, monthly: 1, daily: 2, hourly: 3 }

  belongs_to :salable, polymorphic: true
  belongs_to :currency
end
