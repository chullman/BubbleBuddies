class Meetup < ApplicationRecord

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode, :if => :address_changed?     # auto-fetch coordinates

  has_many :meetupmembers
  has_many :users, through: :meetupmembers

  has_many :meetupcomments
  has_many :comments, through: :meetupcomments

  def full_street_address
    "#{street_address.titleize}, #{city.titleize}, #{state.titleize}, #{country.upcase}"
  end

  def address_changed?
    attrs = %w(street_address city state country)
    attrs.any?{|a| send "#{a}_changed?"}
  end
end
