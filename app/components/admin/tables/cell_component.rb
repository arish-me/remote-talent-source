# frozen_string_literal: true

module Admin
  module Tables
    class CellComponent < ApplicationComponent
      include CellAlignment

      def initialize(primary: false, align: :left)
        @primary = primary
        @align = align
      end

      def call
        tag.td content, class: class_names('', align_class, {
                                             "": primary,
                                             "": !primary
                                           })
      end

      private

      attr_reader :primary, :align
    end
  end
end
