# frozen_string_literal: true

class AddJobBoardToJobs < ActiveRecord::Migration[7.1]
  def change
    add_reference :jobs, :job_board, null: false, foreign_key: true, type: :uuid
  end
end
