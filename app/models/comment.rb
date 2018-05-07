class Comment < ApplicationRecord
  belongs_to :user

  has_many :meetupcomments
  has_many :meetups, through: :meetupcomments
end
