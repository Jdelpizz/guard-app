class CreateGuardAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :guard_assignments do |t|
      t.integer :ASSIGN_ID
      t.string :DATE
      t.integer :LOCA_ID
      t.string :TIME
      t.integer :CWID_S
      t.integer :CWID_J
      t.integer :CWID_SR
    end
  end
end


class GuardAssignments < ApplicationRecord
  belongs_to :location
  belongs_to :cadet
end
