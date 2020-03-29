class Assignemnt < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end

class AssignmentTest < ActiveSupport::TestCase  
  should belong_to(:user)  
  should belong_to(:role)  
end  