# frozen_string_literal: true

# notifier/employee_notifier.rb
class EmployeeNotifier < ApplicationNotifier
  deliver_by :email do |config|
    config.mailer = 'EmployeeMailer'
    config.method = 'welcome'
  end

  notification_methods do
    def message
      "Welcome to Remote Talent source #{params[:employee].name}"
    end

    def content
      ApplicationController.render(
        template: 'employee_mailer/welcome',
        assigns: { employee: params[:employee] },
        layout: false
      )
    end
  end

  required_param :employee
end
