# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Destroy.all(User)
user1 = User.create!(username: 'AG')
user2 = User.create!(username: 'MM')
Destroy.all(Poll)
poll1 = Poll.create!(title: 'Ruby on Rails', id: user1.id)
poll2 = Poll.create!(title: 'Sapphire on Sea', id: user2.id)
