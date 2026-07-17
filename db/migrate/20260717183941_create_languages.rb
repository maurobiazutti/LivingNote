class CreateLanguages < ActiveRecord::Migration[8.1]
  def change
    create_table :languages, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :level

      t.timestamps
    end
  end
end
