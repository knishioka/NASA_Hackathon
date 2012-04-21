class Crater < ActiveRecord::Base
  belongs_to :sphere

  attr_accessible :image_url, :latitude, :longitude, :name, :sphere_id
end
