# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :title
      t.integer :apply_type, default: 0 # Add default value
      t.string :apply_url
      t.boolean :worldwide, default: true
      t.string :badges, default: [], null: false, array: true
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.string :current_state
      t.timestamps
    end
  end
end
