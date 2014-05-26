class User < ActiveRecord::Base
    has_secure_password

    before_save {self.name = name.downcase}
    before_create :create_remember_token

    validates :name,
        presence: true, 
        uniqueness: {case_sensitive: false},
        length: {maximum: 50, minimum: 3}

    validates :password, length: {minimum: 8}

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_remember_token
        self.remember_token = User.digest(User.new_remember_token)
    end

end
