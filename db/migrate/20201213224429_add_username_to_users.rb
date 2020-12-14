class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :employee_id, :integer
      add_column :users, :tier, :string
    end
  end

