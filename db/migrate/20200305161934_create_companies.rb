class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.integer :CO_ID
      t.integer :LOCA_ID
      t.string :CO_NAME
    end
  end
end
