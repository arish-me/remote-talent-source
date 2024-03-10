# frozen_string_literal: true

class AdditionalInformationController < ApplicationController
  before_action :find_user

  def company
    if request.method == 'POST'
      @company = Company.new(company_params)
      respond_to do |format|
        if @company.save
          format.html { redirect_to dashboard_path, notice: 'You are all please complete your profile!' }
          format.json { render :i_want_to_work, status: :created, location: @company }
        else
          format.html { render :company, status: :unprocessable_entity }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    else
      @company = Company.new
    end
  end

  def employee
    if request.method == 'POST'
      @employee = Employee.new(employee_params)
      respond_to do |format|
        if @employee.save
          format.html { redirect_to dashboard_path, notice: 'You are all please complete your profile!' }
          format.json { render :i_want_to_work, status: :created, location: @employee }
        else
          format.html { render :employee, status: :unprocessable_entity }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    else
      @employee = Employee.new
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :primary_role_id, :user_id)
  end

  def company_params
    params.require(:company).permit(:name, :website, :company_email, :phone, :size, :industry, :user_id)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
