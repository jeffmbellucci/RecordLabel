class Track < ActiveRecord::Base
  attr_accessible :album_id, :bonus, :lyrics, :name
  belongs_to :album
  has_one :band, :through => :album

end
