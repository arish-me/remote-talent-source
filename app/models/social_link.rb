# frozen_string_literal: true

class SocialLink < ApplicationRecord
  belongs_to :sociable, polymorphic: true
end
