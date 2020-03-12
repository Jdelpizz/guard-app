class CreateClass < ActiveRecord::Migration[6.0]
  def change
    create_table :classes do |t|
      t.integer :CLASS_ID
      t.string :DAY
      t.string :START_TIME
      t.string :END_TIME
      has_many :enrollments
    end
  end
end
