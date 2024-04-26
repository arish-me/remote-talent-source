# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless current_user

    if current_user.active?
      redirect_to dashboard_path if current_user.admin?
      redirect_to employee_path(current_user.employee) if current_user.employee?
      redirect_to hiring_index_path if current_user.company?
    elsif current_user.pending?
      redirect_to new_additional_information_path(id: current_user.id)
    end
  end
end
