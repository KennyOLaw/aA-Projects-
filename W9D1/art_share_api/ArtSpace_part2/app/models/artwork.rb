class Artwork < ApplicationRecord
  validates :title, :image_url, presence: true 
  validates :image_url, uniqueness: true
  validates :title, uniqueness { scope: :artist_id}
  validates :favorite, inclusion: { in: [true, false]}

  has_many :shares,
    foreign_key: :artwork_id,
    primary_key: :id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  belongs_to :artist,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: :User
    
end 