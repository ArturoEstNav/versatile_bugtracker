class AddLinkToEventables < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :eventable_link, :string, default: ""
  end
end
