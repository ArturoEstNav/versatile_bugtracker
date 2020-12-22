class CorrectCorruptedColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :supervisor
    add_column :users, :supervisor, :boolean
  end
end
