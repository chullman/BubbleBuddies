class MeetupComment < ApplicationRecord
  belongs_to :meetup
  belongs_to :comment
end
