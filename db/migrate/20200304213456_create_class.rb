class CreateClass < ActiveRecord::Migration[6.0]
  def change
    create_table :classes do |t|
      t.int :CLASS_ID
      t.string :DAY
      t.string :START_TIME
      t.string :END_TIME

    end
  end
end
