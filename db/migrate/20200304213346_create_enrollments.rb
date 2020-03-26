class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.integer :ENROLL_ID
      t.integer :CWID
      t.integer :CLASS_ID
    end
  end
end


class Enrollment < ApplicationRecord
  belongs_to :cadet
  belongs_to :class
end
