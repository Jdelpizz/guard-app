class User < ApplicationRecord
    has_secure_password
    has_many :assignments  
    has_many :roles, through: :assignments
end

def role?(role)  
    roles.any? { |r| r.name.underscore.to_sym == role }  
end  