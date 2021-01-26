class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :eventable, polymorphic: true, null: false
      t.text :description

      t.timestamps
    end
  end
end
