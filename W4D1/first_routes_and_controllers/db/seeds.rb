# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

5.times do |i|
    u = User.create!(username: "username#{i}")
    a = Artwork.create!(artist_id: u.id, title: "title#{i}", image_url: "url#{i}")
    as = ArtworkShare.create!(viewer_id: u.id, artwork_id: a.id)
end