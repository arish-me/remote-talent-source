class CreateCompanyRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :company_roles, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :job, null: false, foreign_key: true, type: :uuid
      t.references :role_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
