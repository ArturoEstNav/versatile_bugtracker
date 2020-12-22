class RenameEmployeeIdColumn < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.rename :employee_id, :employee_number
    end
  end
end
