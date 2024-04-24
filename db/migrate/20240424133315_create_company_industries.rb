# frozen_string_literal: true

class CreateCompanyIndustries < ActiveRecord::Migration[7.1]
  def change
    create_table :company_industries, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :industry, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
