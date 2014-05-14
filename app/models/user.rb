require 'bcrypt'

class User
    include Mongoid::Document
    field :name, type: String
    field :email, type: String
    field :password_digest, type: String

    def password
        @password
    end

    def password=(user_password)
        @password = user_password
        self.password_digest = BCrypt::Password.create(user_password)
    end

    def authenticate(test_password)
        if BCrypt::Password.new(self.password_digest) == test_password
            self
        else
            false
        end
    end
end
