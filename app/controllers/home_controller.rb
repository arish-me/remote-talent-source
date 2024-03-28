# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user&.active?
      redirect_to dashboard_path
    elsif current_user&.pending?
      # redirect_to employee_tab_path(id: current_user.id)
      redirect_to new_additional_information_path(id: current_user.id)
    end

    @employees = Employee.all
  end
end
