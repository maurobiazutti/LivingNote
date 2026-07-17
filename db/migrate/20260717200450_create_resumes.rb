class CreateResumes < ActiveRecord::Migration[8.1]
  def change
    create_table :resumes, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.text :objective

      t.timestamps
    end
  end
end
