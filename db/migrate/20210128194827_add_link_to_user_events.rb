class AddLinkToUserEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :user_events, :event_link, :string, default: ""
    rename_column :events, :eventable_link, :event_link
  end
end
