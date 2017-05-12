class CreateNotificas < ActiveRecord::Migration[5.0]
  def change
    create_table :notificas do |t|
      t.references :user, foreign_key: true
      t.references :notified_by, foreign_key: true
      t.string :tipo
      t.boolean :read

      t.timestamps
    end
  end
end
