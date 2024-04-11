# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :primary_roles, dependent: :destroy
  has_many :skills, dependent: :destroy
end
