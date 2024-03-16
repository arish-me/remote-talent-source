class OpenRole < ApplicationRecord
  #belongs_to :employee
  belongs_to :primary_role

  before_create :checker

  def checker
    debugger

  end
end