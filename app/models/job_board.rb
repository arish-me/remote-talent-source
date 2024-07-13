# frozen_string_literal: true

class JobBoard < ApplicationRecord
  has_many :jobs
end
