class Meetup < ApplicationRecord
  has_rich_text :description

  scope :meetup_type, ->(meetup_type) { where("LOWER(meetup_type) like ?", "%#{meetup_type.downcase}%") }

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
    attrs.any? { |a| send "#{a}_changed?" }
  end

  def convert_price_to_cents(price)
    self.price * 100
  end
end
