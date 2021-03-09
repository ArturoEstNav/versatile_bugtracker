class AddTimerStampsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :start_time, :integer, default: 0
    add_column :tickets, :end_time, :integer, default: 0
  end
end
