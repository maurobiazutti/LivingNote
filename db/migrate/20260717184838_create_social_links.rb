class CreateSocialLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :social_links, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :platform

      t.timestamps
    end
  end
end
