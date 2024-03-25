# frozen_string_literal: true

module Employees
  module HasOnlineProfiles
    extend ActiveSupport::Concern
    include UrlAttribute

    included do
      url_attribute :website
      url_attribute :scheduling_link

      url_attribute :github, prefix: 'github.com/'
      url_attribute :twitter, prefix: 'twitter.com/'

      url_attribute :linkedin, prefix: 'linkedin.com/in/' do |value|
        normalized_value = value.gsub(%r{[/\\]}, '') # "/linkedin-username/" => "linkedin-username"
        normalized_value.presence || value
      end
    end
  end
end
