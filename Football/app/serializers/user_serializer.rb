class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :email

  has_many :leagues
  has_many :teams, through: :league
end
