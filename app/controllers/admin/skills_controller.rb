# frozen_string_literal: true

module Admin
  class SkillsController < ApplicationController
    before_action :set_skill, only: %i[show edit update destroy]

    def index
      @skills = Skill.all
    end

    def new
      @skill = Skill.new
    end

    def edit; end

    def create
      @skill = Skill.new(skill_params)

      respond_to do |format|
        if @skill.save
          format.html { redirect_to admin_skills_path, notice: 'Primary Role was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new }
          format.json { render json: @skill.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @skill.update(skill_params)
          format.html { redirect_to admin_skills_path, notice: 'Primary Role was successfully updated.' }
          format.json { render :show, status: :ok, location: @skill }
        else
          format.html { render 'admin/categories/edit' }
          format.json { render json: @skill.errors, status: :unprocessable_entity }
        end
      end
    end

    def show; end

    def destroy
      @skill.destroy
      respond_to do |format|
        format.html { redirect_to admin_skills_path, notice: 'Primary Role was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name, :category_id)
    end
  end
end
