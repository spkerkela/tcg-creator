class User < ActiveRecord::Base
    has_secure_password

    before_save {self.name = name.downcase}

    validates :name,
        presence: true, 
        uniqueness: {case_sensitive: false},
        length: {maximum: 50, minimum: 3}

    validates :password, length: {minimum: 8}


end
