# frozen_string_literal: true

class CreatePreferredLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :preferred_locations, id: :uuid do |t|
      t.references :locatable, polymorphic: true, null: false, type: :uuid
      t.references :location_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
