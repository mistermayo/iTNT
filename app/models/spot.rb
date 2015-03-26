class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates :location, :presence => true
  validates :header, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
  validates :details, :presence => true
  validates :availability, :presence => true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
