class RefactorUserOnTickets < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:tickets, :creator, index: true)
    remove_reference(:tickets, :owner, index: true)
    add_reference :tickets, :creator, foreign_key: { to_table: :users }
    add_reference :tickets, :owner, foreign_key: { to_table: :users }
  end
end
