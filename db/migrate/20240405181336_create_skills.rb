# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills, id: :uuid do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
