class AddRecordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passed, :string, array: true
  end
end
