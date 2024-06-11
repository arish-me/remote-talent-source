# frozen_string_literal: true

class CreateConnectionRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :connection_requests, id: :uuid do |t|
      t.references :employee, null: false, foreign_key: true, type: :uuid
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
