# frozen_string_literal: true

class CreateJobBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :job_boards, id: :uuid do |t|
      t.string :name
      t.string :api_url
      t.string :logo_url
      t.string :api_key
      t.string :api_token
      t.datetime :last_run_at
      t.datetime :last_updated_at

      t.timestamps
    end
  end
end
