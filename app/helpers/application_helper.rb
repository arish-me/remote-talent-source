# frozen_string_literal: true

module ApplicationHelper
  def profile_link
    if current_user.employee?
      edit_employee_path(current_user.employee)
    else
      edit_company_path(current_user.company)
    end
  end

  def render_modal(title: '', body: '', footer: '')
    render(partial: '/shared/modal', locals: { title:, body:, footer: })
  end

  def current_company
    return unless current_user&.company?

    current_user.company
  end
end
