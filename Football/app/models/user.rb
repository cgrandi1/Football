class User < ApplicationRecord
    has_many :leagues
    has_many :teams, :through => :leagues
    
    has_secure_password 
    
    validates :name, presence: true 
    # validates :age, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
end
