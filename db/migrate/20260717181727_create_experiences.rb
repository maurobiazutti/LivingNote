class CreateExperiences < ActiveRecord::Migration[8.1]
  def change
    create_table :experiences, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :company
      t.string :position
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
