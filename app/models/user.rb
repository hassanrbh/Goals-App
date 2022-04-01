# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  username        :string           not null
#  birth_date      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#
class User < ApplicationRecord
    attr_reader :password

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :birth_date, presence: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: {
        minimum: 6, message: 'The password must be at least 6 characters',
        allow_nil: true
    }
    after_initialize :ensure_session_token

    has_many :intention
    # ! scope methods
    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    def is_password!(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    def self.generate_session_token!
        SecureRandom.urlsafe_base64(16)
    end
    def reset_session_token!
        self.session_token = self.class.generate_session_token!
        self.session_token
    end
    def self.find_by_credentials!(email,password)
        user = User.find_by(:email => email)
        return nil if user.nil?
        user if user.is_password!(password)
    end

    private
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token!
    end
end
