class LeftoverColumnPurge < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :owner_id
    remove_column :memos, :user_id
  end
end
