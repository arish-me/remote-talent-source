# frozen_string_literal: true

class AdditionalInformationController < ApplicationController
  def index; end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to thank_you_path, notice: 'Thanks! Check your email to confirm your account.' }
        format.json { render :i_want_to_work, status: :created, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @employee = Employee.new
  end

  def show
    @employee = Employee.new
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :primary_role_id)
  end
end
