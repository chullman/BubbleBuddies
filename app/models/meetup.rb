class Meetup < ApplicationRecord
  belongs_to :comment
a
  has_many :meetupmembers
end
