class AddMediaToAutoveicolo < ActiveRecord::Migration[5.0]
  def change
     add_column :autoveicolos, :media, :float
  end
end
