class TurnEventsIntoParent < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :memo_id
    remove_column :events, :project_id
    remove_column :events, :ticket_id
  end
end



