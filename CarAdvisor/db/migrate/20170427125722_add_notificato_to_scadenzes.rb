class AddNotificatoToScadenzes < ActiveRecord::Migration[5.0]
  def change
	add_column :scadenzes, :notificato, :boolean, default: false
  end
end
