class Album < ActiveRecord::Base
  attr_accessible :band_id, :live, :name
  belongs_to :band
  has_many :tracks

end
