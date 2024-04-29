# frozen_string_literal: true

class CreateJobsCountriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :job_countries, id: :uuid do |t|
      t.references :job, null: false, foreign_key: true, type: :uuid
      t.references :country, null: false, foreign_key: true, type: :uuid
    end
  end
end
