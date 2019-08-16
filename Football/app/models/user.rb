class User < ApplicationRecord
    validates :name, presence: true 
    validates :seriousness_level, presence: true
    validates :age, presence: true
    validates :email, uniqueness: true, on: :create
end
