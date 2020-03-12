class CreateCompany < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.integer :CO_ID
      t.integer :LOCA_ID
      t.string :CO_NAME
      belongs_to :locations
      has_many :cadets
    end
  end
end
