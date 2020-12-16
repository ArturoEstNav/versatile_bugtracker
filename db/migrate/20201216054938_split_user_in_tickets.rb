class SplitUserInTickets < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:tickets, :user, index: true)
    add_reference :tickets, :creator, foreign_key: { to_table: :users }
    add_reference :tickets, :owner, foreign_key: { to_table: :users }
  end
end
