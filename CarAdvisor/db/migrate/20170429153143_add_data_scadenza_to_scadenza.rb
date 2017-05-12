class AddDataScadenzaToScadenza < ActiveRecord::Migration[5.0]
  def change
	add_column :scadenzes, :data_scadenza, :date
  end
end
