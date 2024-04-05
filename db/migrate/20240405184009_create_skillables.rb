class CreateSkillables < ActiveRecord::Migration[7.1]
  def change
    create_table :skillables, id: :uuid do |t|
      t.references :skillable, polymorphic: true, null: false, type: :uuid
      t.references :skill, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
