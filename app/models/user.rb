class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_one :profile

    def profile
        Profile.find_by(user_id: self.id)
    end

end
