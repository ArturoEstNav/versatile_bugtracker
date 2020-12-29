class CorrectionsForNewFunctionality < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :owner_id, :user_id
    remove_index :tickets, :creator_id
    change_column_default :tickets, :priority, from: "3", to: "necessary"
    add_column :projects, :description, :text
    remove_index :memos, :user_id
    remove_index :events, :owner_id
  end
end
