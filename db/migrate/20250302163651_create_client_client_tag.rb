class CreateClientClientTag < ActiveRecord::Migration[6.1]
  def change
    create_table :client_client_tags, id: :uuid do |t|
      t.references :client, foreign_key: true, null: false, type: :uuid
      t.references :client_tag, foreign_key: true, null: false, type: :uuid
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
