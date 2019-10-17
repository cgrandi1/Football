class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :people_in_league

  # has_many: teams

  def self.serialize(league)
   
    # start with the open brace to create a valid JSON object
    serialized_post = '{'
 
    serialized_league += '"id": ' + league.id.to_s + ', '
    serialized_league += '"name": "' + league.name + '", '
    serialized_league += '"cost": "' + league.cost + '", '
    serialized_league += '"cost": "' + league.people_in_league + '", '
 
  #   # the author association can also be represented in JSON
  #   serialized_post += '"author": {'
  #   serialized_post += '"name": "' + post.author.name + '"}'
 
    # and end with the close brace
    serialized_league += '}'
  end
end
