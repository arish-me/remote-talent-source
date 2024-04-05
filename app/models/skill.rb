# frozen_string_literal: true

# app/models/skill.rb
class Skill < ApplicationRecord
  belongs_to :category
  has_many :skillables
  has_many :employees, through: :skillables, source: :skillable, source_type: 'Employee'
  has_many :businesses, through: :skillables, source: :skillable, source_type: 'Company'
end
