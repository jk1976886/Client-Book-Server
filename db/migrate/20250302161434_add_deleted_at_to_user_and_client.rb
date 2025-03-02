class AddDeletedAtToUserAndClient < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deleted_at, :datetime
    add_column :clients, :deleted_at, :datetime
  end
end
