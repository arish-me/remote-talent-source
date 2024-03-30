# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :company_email
      t.string :subtitle
      t.string :phone
      t.string :website
      t.string :size
      t.string :industry
      t.text :bio
      t.timestamps
    end
  end
end
