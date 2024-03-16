class SocialLink < ApplicationRecord
  belongs_to :source, polymorphic: true
end
