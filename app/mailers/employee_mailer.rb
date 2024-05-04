# frozen_string_literal: true

class EmployeeMailer < ApplicationMailer
  def welcome
    @employee = params[:employee]
    mail(to: @employee.user.email, subject: t('.subject'))
  end
end
