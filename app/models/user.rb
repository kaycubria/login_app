class User < ApplicationRecord
    has_secure_password
    before_save { self.email = email.downcase }
    enum role: {admin: 0, user: 1, restricted: 2}
    after_initialize :set_default_role, :if => :new_record?

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, :length => { :minimum => 8 }, on: :create
    validates :phone_number, presence: true
    validates :email, {
        presence: true,
        uniqueness: { case_sensitive: false },
        format: { with: VALID_EMAIL_REGEX }
    }

    def set_default_role
        self.role ||= :user
    end

end
