class Meetup < ApplicationRecord
  has_many :meetupcomments
  has_many :comments, through: :meetupcomments

  has_many :meetupmembers
  has_many :users, through: :meetupmembers
end
