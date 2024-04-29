# frozen_string_literal: true

class CreateLocationTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :location_types, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
