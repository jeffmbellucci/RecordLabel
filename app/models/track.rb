class Track < ActiveRecord::Base
  attr_accessible :album_id, :bonus, :lyrics, :name
  validates :album_id, :name, :presence => :true
  validates :name, :uniqueness => {:scope => :album_id}

  belongs_to :album
  has_one :band, :through => :album
end
