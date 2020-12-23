class AddDefaultUsernameToColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, default: "#{:first_name}_#{:last_name}"
  end
end
