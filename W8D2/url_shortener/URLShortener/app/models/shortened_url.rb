class ShortenedUrl < ApplicationRecord
  
    validates :long_url, :short_url, presence: true 
    validates :short_url, uniqueness: true

    def self.random_code
      found = false 
      until found
        found = true
        secure = SecureRandom::urlsafe_base64(16)
        if  ShortenedUrl.exists?(short_url: secure)
          found = false 
        end     
      end  
      return secure 
    end

    def self.factory(user, long_url)
      secure = ShortenedUrl.random_code
      ShortenedUrl.create!(long_url: long_url, short_url: secure, user_id: user.id)
    end 
    
    has_many :vistors
      class_name: :Visit,
      primary_key: :id,
      foreign_key: :url_id

    def num_clicks
      vistors.count
    end 

    def num_uniques
      vistors.count.distinct
    end 

    def num_recent_uniques
      
    end 
end