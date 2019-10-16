class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :people_in_league

  has_many: teams
end
