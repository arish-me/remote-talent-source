class CreateRoleTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :role_types, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
