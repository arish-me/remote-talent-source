# frozen_string_literal: true

class SocialLink < ApplicationRecord
  belongs_to :source, polymorphic: true
end
