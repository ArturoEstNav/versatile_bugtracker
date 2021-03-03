class AddingActiveToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :active, :boolean, default: false
  end
end
