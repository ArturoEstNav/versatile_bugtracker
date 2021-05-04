class CreateWorkingTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :working_tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true
      t.float :worked_time, default: 0.0

      t.timestamps
    end
  end
end
