# frozen_string_literal: true

class CreateOpenRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :open_roles, id: :uuid do |t|
      t.references :primary_role, null: false, foreign_key: true, type: :uuid
      t.references :employee, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
