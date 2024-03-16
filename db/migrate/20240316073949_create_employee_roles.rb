class CreateEmployeeRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_roles, id: :uuid do |t|
      t.references :employee, null: false, foreign_key: true, type: :uuid
      t.references :role_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
