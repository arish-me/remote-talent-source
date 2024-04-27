# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true
  has_many :primary_roles, dependent: :destroy
  has_many :skills, dependent: :destroy
end
