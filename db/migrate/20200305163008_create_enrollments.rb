class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.integer :ENROLL_ID
      t.integer :CWID
      t.string :class
      has_many :classes
      belongs_to :cadets
    end
  end
end
