# frozen_string_literal: true

class CreatePrimaryRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :primary_roles, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
