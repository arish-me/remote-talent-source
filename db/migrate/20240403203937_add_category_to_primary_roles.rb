# frozen_string_literal: true

class AddCategoryToPrimaryRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :primary_roles, :category_id, :uuid, null: false
    # Optionally, if you want to add an index on the category_id column
    add_index :primary_roles, :category_id

    # If you want to enforce foreign key constraint with the categories table
    # ensure that the categories table has a primary key of type UUID
    add_foreign_key :primary_roles, :categories, column: :category_id
  end
end
