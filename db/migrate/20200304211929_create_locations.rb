class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :LOCA_ID
      t.string :LOCA_NAME
    end
  end
end


class Location < ApplicationRecord
    has_many :companies
    has_many :guard_assignments
end