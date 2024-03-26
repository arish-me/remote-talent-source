# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = I18n.t("errors.unauthorized")
    redirect_back_or_to root_path, allow_other_host: false
  rescue ActionController::Redirecting::UnsafeRedirectError
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    if resource.pending?
      # employee_tab_path(current_user.id)
      new_additional_information_path
    else
      dashboard_path
    end
  end
end
