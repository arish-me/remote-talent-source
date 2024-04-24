# frozen_string_literal: true

class CreateIndustries < ActiveRecord::Migration[7.1]
  def change
    create_table :industries, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
