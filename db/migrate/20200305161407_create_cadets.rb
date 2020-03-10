class CreateCadets < ActiveRecord::Migration[6.0]
  def change
    create_table :cadets do |t|
      t.integer :CWID
      t.integer :CO_ID
      t.string :F_NAME
      t.string :M_INITIAL
      t.string :L_NAME
      t.integer :R_NUM
      t.integer :P_NUM
      t.string :EMAIL
      t.string :RANK
      belongs_to :enrollments
    end
  end
end
