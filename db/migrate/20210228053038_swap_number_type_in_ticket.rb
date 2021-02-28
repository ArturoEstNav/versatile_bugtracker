class SwapNumberTypeInTicket < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :completion_time
    add_column :tickets, :completion_time, :float, default: 0.0
  end
end
