class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    #password_digestカラムとhas_secure_passwordでログイン認証が可能になる
    has_secure_password
end
