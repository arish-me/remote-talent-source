# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries, id: :uuid do |t|
      t.string :name
      t.string :emoji
      t.string :iso2
      t.string :iso3

      t.references :currency, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
