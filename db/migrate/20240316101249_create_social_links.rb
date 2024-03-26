# frozen_string_literal: true

class CreateSocialLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_links, id: :uuid do |t|
      t.string :website
      t.string :linkedin
      t.string :github
      t.string :twitter
      t.string :gitlab
      t.string :stackoverflow
      t.references :sociable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
