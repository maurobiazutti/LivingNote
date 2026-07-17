class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :full_name
      t.string :cpf
      t.string :platform_name
      t.string :phone
      t.text :bio
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
