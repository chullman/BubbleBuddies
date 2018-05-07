class Meetup < ApplicationRecord
  has_many :meetupmembers
  has_many :users, through: :meetupmembers

  has_many :meetupcomments
  has_many :comments, through: :meetupcomments
end
