class CreateClientEvent < ActiveRecord::Migration[6.1]
  def change
    create_table :client_events, id: :uuid do |t|
      t.references :client, foreign_key: true, null: false, type: :uuid
      t.integer :type, null: false, default: 0
      t.text :description
      t.datetime :event_date
      t.decimal :purchase_value, default: "0.0"
      t.text :purcahse_items
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
