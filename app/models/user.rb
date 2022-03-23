class User < ApplicationRecord
    
    validates :cellphone, presence:true
    validates :first_name, presence:true
    validates :last_name, presence:true
    validates :email, presence:true
    validates :username, presence:true, uniqueness: {case_sensitive: false}
    
    has_secure_password

   
end




