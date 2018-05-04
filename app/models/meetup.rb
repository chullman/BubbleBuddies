class Meetup < ApplicationRecord
  belongs_to :comment

  has_many :meetupmembers
end
