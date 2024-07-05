# frozen_string_literal: true

class Currency < ApplicationRecord
  scope :default_currency, -> { Currency.find_by(name: 'USD') }
end
