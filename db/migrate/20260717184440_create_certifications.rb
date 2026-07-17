class CreateCertifications < ActiveRecord::Migration[8.1]
  def change
    create_table :certifications, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :issuer
      t.date :issue_date

      t.timestamps
    end
  end
end
