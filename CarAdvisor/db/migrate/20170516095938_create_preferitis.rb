class CreatePreferitis < ActiveRecord::Migration[5.0]
  def change
    create_table :preferitis do |t|
      t.references :user, foreign_key: true
      t.integer :meccanico

      t.timestamps
    end
  end
end
