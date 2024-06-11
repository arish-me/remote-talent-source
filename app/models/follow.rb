# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :employee
  belongs_to :company
end
