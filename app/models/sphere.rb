class Sphere < ActiveRecord::Base
  has_many :craters

  attr_accessible :name
end
