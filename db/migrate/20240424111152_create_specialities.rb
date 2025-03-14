# frozen_string_literal: true

class CreateSpecialities < ActiveRecord::Migration[7.1]
  def change
    create_table :specialities, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
