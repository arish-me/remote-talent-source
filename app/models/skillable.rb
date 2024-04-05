# frozen_string_literal: true

# app/models/skillable.rb
class Skillable < ApplicationRecord
  belongs_to :skill
  belongs_to :skillable, polymorphic: true
end
