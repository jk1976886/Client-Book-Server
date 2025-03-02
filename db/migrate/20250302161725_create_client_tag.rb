class CreateClientTag < ActiveRecord::Migration[6.1]
  def change
    create_table :client_tags, id: :uuid do |t|
      t.string :name, null: false
      t.integer :order, null: false, default: 1
      t.references :user, foreign_key: true, null: false, type: :uuid
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
