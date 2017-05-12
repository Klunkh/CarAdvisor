class CreateScadenzes < ActiveRecord::Migration[5.0]
  def change
    create_table :scadenzes do |t|
      t.references :user, foreign_key: true
      t.string :tipo
      t.date :dataStipulazione
      t.float :km
      t.string :tipoScadenza

      t.timestamps
    end
  end
end
