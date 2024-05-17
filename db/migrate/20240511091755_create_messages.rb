class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :conversation, type: :uuid
      t.references :sender, polymorphic: true, type: :uuid
      t.text :content

      t.timestamps
    end
  end
end
