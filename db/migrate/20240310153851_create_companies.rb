# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :company_email
      t.string :tagline
      t.integer :founded
      t.string :phone
      t.string :website
      t.string :size
      t.string :public_url
      t.timestamps
    end
  end
end
