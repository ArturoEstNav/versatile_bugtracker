class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_events
    create_table :user_events do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
