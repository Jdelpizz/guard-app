class User < ApplicationRecord::Base
  has_secure_password
  
  has_many :assignments
  has_many :roles, through: :assignments
end

class UserTest < ActiveSupport::TestCase
  should have_many(:assignments)
  should have_many(:roles).through(:assignments)
end


def role?(role)  
roles.any? { |r| r.name.underscore.to_sym == role }  
end 

test "user should have role" do  
assert_not(@subject.role? :admin)

@subject.roles << Role.new(name: "admin")

assert(@subject.role? :admin)  
end  