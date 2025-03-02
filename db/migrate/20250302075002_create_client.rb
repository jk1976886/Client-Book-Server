class CreateClient < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true, null: false
      t.string :email
      t.string :phone
      t.string :wechat
      t.timestamps
    end
  end
end
