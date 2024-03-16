class CreateSocialLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_links, id: :uuid do |t|
      t.string :website
      t.string :linkedin
      t.string :github
      t.string :twitter
      t.string :gitlab
      t.string :stackoverflow
      t.integer :source_id, null: false
      t.string :source_type, null: false

      t.timestamps
    end
  end
end
