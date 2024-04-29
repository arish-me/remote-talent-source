# frozen_string_literal: true

class CreateSalaries < ActiveRecord::Migration[7.1]
  def change
    create_table :salaries, id: :uuid do |t|
      t.references :salable, polymorphic: true, null: false, type: :uuid
      t.decimal :min, default: 0.00 # Add default value
      t.decimal :max, default: 0.00 # Add default value
      t.integer :salary_type, default: 0 # Add default value
      t.references :currency, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
