# frozen_string_literal: true

module Admin
  class EmailLinkComponent < ApplicationComponent
    def initialize(email)
      @email = email
    end

    def call
      link_to email, "mailto:#{email}", class: 'hover:underline'
    end

    private

    attr_reader :email
  end
end
