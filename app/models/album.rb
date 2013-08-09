class Album < ActiveRecord::Base
  attr_accessible :band_id, :live, :name
  validates :name, :presence => :true, :uniqueness => :true
  validates :band_id, :presence => :true



  belongs_to :band
  has_many :tracks, :dependent => :destroy


end
