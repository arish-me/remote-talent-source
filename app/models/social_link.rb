# frozen_string_literal: true

# models/social_link
class SocialLink < ApplicationRecord
  include Employees::HasOnlineProfiles
  belongs_to :sociable, polymorphic: true
end
