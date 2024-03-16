# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :scheduling_link
      t.string :experience
      t.string :heading
      t.string :phone
      t.integer :search_status, default: 0
      t.text :bio
      t.references :primary_role, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
