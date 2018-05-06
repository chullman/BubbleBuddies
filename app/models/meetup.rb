class Meetup < ApplicationRecord
  belongs_to :comment

  has_many :meetupmembers
  has_many :users, though: :meetupmembers
end
