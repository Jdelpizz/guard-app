class AddClassesToCadets < ActiveRecord::Migration[6.0]
  def change
    add_column :cadets, :monday, :string
    add_column :cadets, :tuesday, :string 
    add_column :cadets, :wednesday, :string  
    add_column :cadets, :thursday, :string 
    add_column :cadets, :friday, :string 
  end
end
