class Visit < ApplicationRecord 
  validates :user_id, :url_id, presence: true 

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, url_id: shortened_url.id)
  end

  belongs_to :user 
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

    belongs_to :url
      class_name: :ShortenedUrl,
      primary_key: :id,
      foreign_key: :url_id
  
end 