class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.integer :RANK_ID
      t.string :RANK_NAME
      t.boolean :BOL_SWORD
      has_many :cadets
    end
  end
end
