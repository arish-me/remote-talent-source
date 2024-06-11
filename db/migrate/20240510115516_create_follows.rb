# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows, id: :uuid do |t|
      t.references :employee, null: false, foreign_key: true, type: :uuid
      t.references :company, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
