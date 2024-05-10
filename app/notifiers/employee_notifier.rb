# frozen_string_literal: true

# notifier/employee_notifier.rb
class EmployeeNotifier < Noticed::Event
  deliver_by :turbo_stream, class: 'DeliveryMethods::TurboStream'
  deliver_by :email do |config|
    config.mailer = 'EmployeeMailer'
    config.method = 'welcome'
  end

  notification_methods do
    def message
      "Welcome to Remote Talent source #{params[:employee].name}"
    end

    def content(type = :html)
      ApplicationController.render(
        template: 'employee_mailer/welcome',
        assigns: { employee: params[:employee] },
        layout: false,
        formats: [type]
      )
    end
  end

  required_param :employee
end
