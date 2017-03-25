class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :password
      t.boolean :tipo

      t.timestamps
    end
  end
end
