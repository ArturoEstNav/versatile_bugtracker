class AddLinkToUserEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :eventable_link, :event_link
  end
end
