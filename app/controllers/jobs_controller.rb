# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_company, only: %i[new create]

  def index; end

  def new
    @job = @company.jobs.new
    @job.build_company_role
    @job.build_preferred_location
    @job.build_salary
  end

  def create
    @job = @company.jobs.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def job_params
    params.require(:job).permit(
      :title,
      :user_id,
      :country_id,
      company_role_attributes: %i[role_type_id company_id],
      preferred_location_attributes: %i[id name location_type_id],
      salary_attributes: %i[id min max salary_type currency_id]
    )
  end

  def set_company
    @company = current_user.company
  end
end
