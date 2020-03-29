class CreateAssignemnts < ActiveRecord::Migration[6.0]
  def change
    create_table :assignemnts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role

      t.timestamps
    end
  end
end
