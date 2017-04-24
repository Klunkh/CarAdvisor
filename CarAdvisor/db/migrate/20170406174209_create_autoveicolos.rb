class CreateAutoveicolos < ActiveRecord::Migration[5.0]
  def change
    create_table :autoveicolos do |t|
      t.references :user, foreign_key: true
      t.string :targa
      t.string :modello
      t.string :carburante
      t.float :kilometri

      t.timestamps
    end 
    
  end
end
