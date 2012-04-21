class Crater < ActiveRecord::Base
  belongs_to :sphere
  has_one :crater_like_count

  attr_accessible :image_url, :latitude, :longitude, :name, :sphere_id
end
