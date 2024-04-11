# frozen_string_literal: true

class ImpersonatingBannerComponent < ApplicationComponent
  def render?
    helpers.current_user != helpers.true_user
  end
end
