class MoveTrackingLogicToConcerns < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :completion_time, :working_time
    add_column :working_tickets, :start_time, :integer, default: 0
    add_column :working_tickets, :end_time, :integer, default: 0
  end
end
