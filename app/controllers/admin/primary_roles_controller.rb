# frozen_string_literal: true

module Admin
  class PrimaryRolesController < ApplicationController
    before_action :set_primary_role, only: %i[show edit update destroy]

    def index
      @primary_roles = PrimaryRole.all
    end

    def new
      @primary_role = PrimaryRole.new
    end

    def edit; end

    def create
      @primary_role = PrimaryRole.new(primary_role_params)

      respond_to do |format|
        if @primary_role.save
          format.html { redirect_to admin_primary_roles_path, notice: 'Primary Role was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new }
          format.json { render json: @primary_role.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @primary_role.update(primary_role_params)
          format.html { redirect_to admin_primary_roles_path, notice: 'Primary Role was successfully updated.' }
          format.json { render :show, status: :ok, location: @primary_role }
        else
          format.html { render 'admin/categories/edit' }
          format.json { render json: @primary_role.errors, status: :unprocessable_entity }
        end
      end
    end

    def show; end

    def destroy
      @primary_role.destroy
      respond_to do |format|
        format.html { redirect_to admin_primary_roles_path, notice: 'Primary Role was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_primary_role
      @primary_role = PrimaryRole.find(params[:id])
    end

    def primary_role_params
      params.require(:primary_role).permit(:name, :category_id)
    end
  end
end
