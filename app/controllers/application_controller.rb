# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.pending?
      additional_information_path(resource)
    else
      dashboard_path
    end
  end
end
