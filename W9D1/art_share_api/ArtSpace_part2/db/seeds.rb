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
Comment.destroy_all
Like.destroy_all

user1 = User.create!(username: 'drkernall')
user2 = User.create!(username: 'billyidol')
user3 = User.create!(username: 'kennyOlaw')
user4 = User.create!(username: 'jamiejam')
user5 = User.create!(username: 'timmytunes')

artwork1 = Artwork.create!(title: 'moneywiser', image_url: 'google.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'purple-n-me', image_url: 'google1.com', artist_id: user2.id, favorite: true)
artwork3 = Artwork.create!(title: 'jimmy4life', images_url: 'google3.com', artist_id: user4.id favorite: true)
artwork4 = Artwork.create!(title: 'fallen', image_url: 'google4.com' artist_id: user3.id)

ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id, favorite: true)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user1.id, favorite: true)
ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user5.id, favorite: true)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user4.id)
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user5.id, favorite: true)

# comment1 = Comment.create!(body: 'great!', user_id: user1.id, artwork_id: artwork1.id)
# comment2 = Comment.create!(body: 'another great one', user_id: user2.id, artwork_id: artwork2.id)

# Like.create!(user_id: user1.id, likeable_id: comment1.id, likeable_type: 'Comment')
# Like.create!(user_id: user2.id, likeable_id: artwork2.id, likeable_type: 'Artwork')
# Like.create!(user_id: user1.id, likeable_id: artwork2.id, likeable_type: 'Artwork')
# Like.create!(user_id: user2.id, likeable_id: comment1.id, likeable_type: 'Comment')
