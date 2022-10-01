class Comment < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  has_many :meetupcomments
  has_many :meetups, through: :meetupcomments
end
