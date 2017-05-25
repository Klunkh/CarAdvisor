class CreateConversaziones < ActiveRecord::Migration[5.0]
  def change
    create_table :conversaziones do |t|
      t.references :user, foreign_key: true
      t.string :destinatario
      t.string :messaggio
      t.boolean :letto
      t.boolean :inviato

      t.timestamps
    end
  end
end
