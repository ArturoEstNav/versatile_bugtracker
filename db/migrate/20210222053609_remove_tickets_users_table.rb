class RemoveTicketsUsersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :tickets_users
  end
end
