require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:assignments)  
  should have_many(:roles).through(:assignments)
end

test "user should have role" do  
assert_not(@subject.role? :admin)

@subject.roles << Role.new(name: "admin")

assert(@subject.role? :admin)  
end  