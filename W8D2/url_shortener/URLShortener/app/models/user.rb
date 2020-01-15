class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true  
  

  has_many :visisted_urls
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :user_id
    
end 