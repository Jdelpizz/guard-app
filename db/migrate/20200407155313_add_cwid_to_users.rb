class AddCwidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :CWID, :integer
  end
end
