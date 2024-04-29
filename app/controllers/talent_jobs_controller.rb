# frozen_string_literal: true

class TalentJobsController < ApplicationController
  def index
    @query = JobQuery.new(query_params.merge(user: current_user))
  end

  def show; end

  private

  def query_params
    permitted = policy(%i[jobs query]).permitted_attributes
    params.permit(permitted)
  end
end
