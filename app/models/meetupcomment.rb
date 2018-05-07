class Meetupcomment < ApplicationRecord
  belongs_to :meetup
  belongs_to :comment
end