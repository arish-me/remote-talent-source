# frozen_string_literal: true

module ApplicationHelper
  def profile_link
    if current_user.employee?
      edit_employee_path(current_user.employee)
    else
      edit_company_path(current_user.company)
    end
  end
end
