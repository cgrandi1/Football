# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Player.create(name: "Dwayne", position: "RB1", fantasy_points: 24, starter: true, team_id: 1)
Player.create(name: "Lebron", position: "RB2", fantasy_points: 25, starter: true, team_id: 1)
Player.create(name: "Chris", position: "WR1", fantasy_points: 30, starter: true, team_id: 1)
Player.create(name: "Shourj", position: "WR2", fantasy_points: 32, starter: true, team_id: 1)
Player.create(name: "Drew", position: "QB", fantasy_points: 33, starter: true, team_id: 1)
Player.create(name: "Ben", position: "TE", fantasy_points: 50, starter: true, team_id: 1)
Player.create(name: "Body", position: "DEF", fantasy_points: 29, starter: true, team_id: 1)
Player.create(name: "Yis", position: "K", fantasy_points: 5, starter: true, team_id: 1)
Player.create(name: "Rebecca", position: "FLEX", fantasy_points: 12, starter: true, team_id: 1)

