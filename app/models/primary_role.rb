# frozen_string_literal: true

class PrimaryRole < ApplicationRecord
  belongs_to :category
  has_many :open_roles
  has_many :employees, through: :open_roles
end
