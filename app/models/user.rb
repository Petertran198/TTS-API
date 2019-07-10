class User < ApplicationRecord
    has_many :tasks
    has_secure_password #Built in method from Bcrypt gem used to encrypt and authenticate passwords  
end
