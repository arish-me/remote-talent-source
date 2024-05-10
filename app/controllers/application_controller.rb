# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :turbo_frame_request_variant
  impersonates :user

  def user_not_authorized
    flash[:alert] = I18n.t('errors.unauthorized')
    redirect_back_or_to root_path, allow_other_host: false
  rescue ActionController::Redirecting::UnsafeRedirectError
    redirect_to root_path
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  def after_sign_in_path_for(resource)
    if resource.pending?
      new_additional_information_path
    elsif resource.active? && current_user.admin?
      dashboard_path
    elsif resource.employee && resource.active?
      employee_path(current_user.employee)
    elsif resource.company && resource.active?
      hiring_index_path
    end
  end
end
