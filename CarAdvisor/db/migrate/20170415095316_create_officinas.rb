class CreateOfficinas < ActiveRecord::Migration[5.0]
  def change
    create_table :officinas do |t|
      t.references :user, foreign_key: true
      t.string :indirizzo
      t.string :contatto
      t.integer :numero_telefono

      t.timestamps
    end
  end
end
