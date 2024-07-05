# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :title
      t.integer :apply_type, default: 0 # Add default value
      t.string :apply_url
      t.boolean :worldwide, default: true
      t.string :badges, default: [], null: false, array: true
      t.references :user, foreign_key: true, type: :uuid
      t.references :company, foreign_key: true, type: :uuid
      t.string :current_state
      t.string :slug
      t.string :source_id
      t.string :source_name
      t.string :source_logo
      t.datetime :publish_date
      t.integer :job_type
      t.string :position
      t.timestamps
    end
  end
end
