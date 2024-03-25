# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :country_code
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.string :address, null: false
      t.string :time_zone
      t.integer :utc_offset
      t.jsonb :data
      t.references :locatable, polymorphic: true, null: false, type: :uuid
      t.timestamps
    end
  end
end
