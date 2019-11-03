class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :user_id, :league_id

  belongs_to :league
  belongs_to :user
end
