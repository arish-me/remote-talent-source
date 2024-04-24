# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]
  before_action :build_associations, only: %i[edit new]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
    authorize current_user
  end

  # GET /companies/1 or /companies/1.json
  def show
    authorize @company
  end

  # GET /companies/new
  def new
    @company = Company.new
    authorize current_user
  end

  # GET /companies/1/edit
  def edit
    authorize @company
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    authorize @company
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    authorize current_user
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def build_associations
    @company.build_location if @company.location.nil?
    @company.build_company_industry if @company.company_industry.nil?
    @company.company_specialities.build if @company.company_specialities.empty?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  def location_attributes
    %i[city state country address
       latitude longitude _destroy]
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(
      :user_id,
      :name,
      :company_email,
      :phone,
      :website,
      :size,
      :industry,
      :bio,
      :avatar,
      speciality_ids: [],
      company_industry_attributes: %i[id  industry_id _destroy],
      location_attributes: %i[
        id city state country address
        latitude longitude _destroy
      ]
    )
  end
end
