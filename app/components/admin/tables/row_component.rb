# frozen_string_literal: true

module Admin
  module Tables
    class RowComponent < ApplicationComponent
      renders_many :cells, CellComponent
    end
  end
end
