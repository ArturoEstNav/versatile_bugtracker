class AddJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tickets
    add_column :tickets, :completion_time, :integer, default: 0
  end
end
