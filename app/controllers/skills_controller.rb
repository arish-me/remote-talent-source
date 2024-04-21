class SkillsController < ApplicationController
  def index
    # Fetch skills based on selected roles
    selected_roles = params[:selected_roles]
    # Process data and render response

    @skills = PrimaryRole.where(id: selected_roles.split(",")).flat_map(&:skills).uniq

    render turbo_stream: turbo_stream.update("skills-frame", partial: "skills/skills", locals: { skills: @skills })
  end
end
