# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def after_sign_in_path_for(resource)
    if resource.pending?
      # employee_tab_path(current_user.id)
      new_additional_information_path
    else
      dashboard_path
    end
  end
end
