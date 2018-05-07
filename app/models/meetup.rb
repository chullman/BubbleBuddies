class Meetup < ApplicationRecord

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  has_many :meetupmembers
  has_many :users, through: :meetupmembers

  has_many :meetupcomments
  has_many :comments, through: :meetupcomments

  def full_street_address
    "#{street_address}, #{city}, #{state}, #{country}"
  end
end
