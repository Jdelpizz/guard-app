class CreateCStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :c_statuses do |t|
      t.integer :C_ID
      t.string :C_NAME
    end
  end
end
