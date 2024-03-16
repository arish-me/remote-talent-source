class CreateRoleLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :role_levels, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
