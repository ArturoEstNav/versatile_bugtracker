class AddDefaultValuesToModels < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :active, :boolean, default: true
    change_column :tickets, :status, :string, default: "open"
    add_column :tickets, :priority, :string, default: "3"
    add_column :tickets, :category, :string
  end
end
