class RemoveConflictingColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :supervisor
    remove_column :tickets, :user_id
    remove_column :tickets, :creator_id
  end
end
