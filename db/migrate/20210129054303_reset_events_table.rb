class ResetEventsTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :eventable, polymorphic: true
    remove_column :events, :description
    remove_column :events, :eventable_link

    add_reference :events, :eventable, polymorphic: true, index: true
    add_reference :events, :user
    add_column :events, :description, :string
    add_column :events, :link, :string, default: ""
    rename_column :user_events, :event_link, :link
  end
end
