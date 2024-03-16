# frozen_string_literal: true

class CreateEmployeeLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_levels, id: :uuid do |t|
      t.references :employee, null: false, foreign_key: true, type: :uuid
      t.references :role_level, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
