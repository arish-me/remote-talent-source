# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
