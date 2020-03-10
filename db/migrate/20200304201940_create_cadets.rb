class CreateCadets < ActiveRecord::Migration[6.0]
  def change
    create_table :cadets do |t|
      t.integer :CWID
      t.integer :CO_ID
      t.string :F_NAME
      t.string :M_INITIAL
      t.string :L_NAME
      t.string :R_NUM
      t.string :P_NUM
      t.string :EMAIL
      t.integer :RANK_ID

    end
  end
end
