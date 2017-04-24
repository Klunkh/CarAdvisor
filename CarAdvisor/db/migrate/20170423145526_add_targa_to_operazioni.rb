class AddTargaToOperazioni < ActiveRecord::Migration[5.0]
  def change
    add_column :operazionis, :targa, :string
    add_column :operazionis, :costo, :float
  end
end
