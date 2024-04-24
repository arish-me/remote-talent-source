# frozen_string_literal: true

class CreateCompanySpecialities < ActiveRecord::Migration[7.1]
  def change
    create_table :company_specialities, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :speciality, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
