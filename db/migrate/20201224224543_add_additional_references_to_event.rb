class AddAdditionalReferencesToEvent < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :memo, foreign_key: { to_table: :memos }
    add_reference :events, :project, foreign_key: { to_table: :projects }
  end
end
