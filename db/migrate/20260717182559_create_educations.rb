class CreateEducations < ActiveRecord::Migration[8.1]
  def change
    create_table :educations, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :institution
      t.string :course
      t.string :degree
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
