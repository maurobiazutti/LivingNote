class CreateAddresses < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :street
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end
end
