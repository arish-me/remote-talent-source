# frozen_string_literal: true

# app/models/skill.rb
class Skill < ApplicationRecord
  belongs_to :category
end
