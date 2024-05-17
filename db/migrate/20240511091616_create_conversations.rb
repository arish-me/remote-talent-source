class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations, id: :uuid do |t|
      t.belongs_to :employee, null: false, foreign_key: true, type: :uuid
      t.belongs_to :company, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
