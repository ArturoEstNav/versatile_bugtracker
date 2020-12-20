class AddManagerToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :tier
    add_column :users, :active, :boolean
    add_column :users, :supervisor, :boolean
  end
end
