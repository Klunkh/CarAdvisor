class AddTargaToScadenzes < ActiveRecord::Migration[5.0]
  def change
    add_column :scadenzes, :targa, :string
  end
end
