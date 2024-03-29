class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.text :description
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
