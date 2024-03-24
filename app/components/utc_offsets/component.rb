# frozen_string_literal: true

module UtcOffsets
  class Component < ApplicationComponent
    def initialize(utc_offset)
      @utc_offset = utc_offset
    end

    def formatted_utc_offset
      "GMT#{plus_minus}#{utc_offset}"
    end

    private

    def plus_minus
      '+' if @utc_offset.positive?
    end

    def utc_offset
      utc_offset = @utc_offset.fdiv(60 * 60)
      return if utc_offset.zero?

      number_with_precision(utc_offset, precision: 1, strip_insignificant_zeros: true).to_i
    end
  end
end
