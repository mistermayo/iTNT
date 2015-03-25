class Spot < ActiveRecord::Base
  belongs_to :user
  validates :location, :presence => true
  validates :heading, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
  validates :details, :presence => true
  validates :availability, :presence => true
end 
