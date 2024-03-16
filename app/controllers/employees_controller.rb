# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: %i[show edit update destroy]
  before_action :build_associations, only: %i[edit]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to edit_employee_path(@employee), notice: 'Profile was successfully updated.' }
        # format.html { render :edit, status: :ok, notice: 'Employee was successfully updated.' }
        format.json { render :edit, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def build_associations
    @employee.open_roles.build if @employee.open_roles.empty?
    @employee.employee_roles.build if @employee.employee_roles.empty?
    @employee.employee_levels.build if @employee.employee_levels.empty?
    @employee.build_social_link if @employee.social_link.nil?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(
      :first_name, :last_name, :primary_role_id, :experience,
      :bio, :search_status, :heading, :avatar,
      open_roles_attributes: %i[id primary_role_id _destroy],
      employee_roles_attributes: %i[id role_type_id _destroy],
      employee_levels_attributes: %i[id role_level_id destroy],
      social_link_attributes: %i[id website linkedin github twitter gitlab stackoverflow]
    )
  end
end
