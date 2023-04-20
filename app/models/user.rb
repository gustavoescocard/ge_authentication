class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, format: { with: /@/, message: "email precisa conter '@'" },
                      uniqueness: { message: "Este email já esta em uso. " }
end
