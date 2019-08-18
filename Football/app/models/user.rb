class User < ApplicationRecord
    has_many :leagues
    has_many :players, :through => :leagues
    has_secure_password 
    
    validates :name, presence: true 
    validates :seriousness_level, presence: true, length: { maximum: 10 }
    validates :age, presence: true
    validates :email, uniqueness: true, on: :create
end
