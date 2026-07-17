class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :full_name
      t.string :cpf
      t.string :platform_name
      t.string :phone
      t.text :bio
      # t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    # 2. Adiciona a coluna bigint depois que a tabela já nasceu isolada
    add_column :profiles, :user_id, :bigint, null: false
    
    # 3. Cria o índice e a chave estrangeira manualmente
    add_index :profiles, :user_id
    add_foreign_key :profiles, :users, column: :user_id
  end
end
