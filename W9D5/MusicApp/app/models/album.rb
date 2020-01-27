class Album < ApplicationRecord
  validates :title, :yr, :quality, presence: true 
  validates :quality, inclusion: { in: ["Live", "Studio"]}

  belongs_to :band, 
    foreign_key: :band_id,
    primary_key: :id,
    class_name: :Band 

end 