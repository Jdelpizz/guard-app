class CreateRoleTests < ActiveRecord::Migration[6.0]
  def change
    create_table :role_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
