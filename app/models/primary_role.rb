# frozen_string_literal: true

class PrimaryRole < ApplicationRecord
  has_many :open_roles
  has_many :employees, through: :open_roles
end
