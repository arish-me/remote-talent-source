# frozen_string_literal: true

module Employees
  class SocialLinkComponent < ApplicationComponent
    include LinksHelper

    attr_reader :network

    def initialize(handle, network)
      @handle = handle
      @network = network
    end

    def render?
      handle.present?
    end

    def handle
      sanitize(@handle)
    end

    def url
      case network
      when :github
        "https://github.com/#{handle}"
      when :twitter
        "https://twitter.com/#{handle}"
      when :linkedin
        "https://www.linkedin.com/in/#{handle}"
      when :stack_overflow
        "https://stackoverflow.com/users/#{handle}"
      when :calendar
        "https://#{handle}"
      end
    end

    def icon
      "icons/brands/#{network}.svg"
    end
  end
end
