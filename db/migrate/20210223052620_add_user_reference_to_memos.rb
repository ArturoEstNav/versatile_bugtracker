class AddUserReferenceToMemos < ActiveRecord::Migration[6.0]
  def change
    add_reference :memos, :user
  end
end
