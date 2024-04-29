# frozen_string_literal: true

# app/controllers/jobs_controller.rb
class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_job, only: %i[edit update show change_status]

  before_action :set_company

  def index
    @jobs = @company.jobs
    authorize @jobs
  end

  def new
    @job = @company.jobs.new
    @job.build_company_role
    @job.build_preferred_location
    @job.build_salary

    authorize @job
  end

  def edit; end

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
    authorize @job
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
    authorize @job
  end

  def change_status
    @job.set_job_status
    redirect_to jobs_path
  end

  def show; end

  private

  def job_params
    params.require(:job).permit(
      :title,
      :user_id,
      :apply_type,
      :apply_url,
      :description,
      country_ids: [],
      company_role_attributes: %i[id role_type_id company_id _destroy],
      preferred_location_attributes: %i[id name location_type_id],
      salary_attributes: %i[id min max salary_type currency_id]
    )
  end

  def set_company
    @company = current_user&.company || @job.company
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
