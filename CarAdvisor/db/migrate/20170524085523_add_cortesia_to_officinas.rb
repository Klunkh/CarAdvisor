class AddCortesiaToOfficinas < ActiveRecord::Migration[5.0]
  def change
    add_column :officinas, :cortesia, :boolean, :default =>false 
  end
end
