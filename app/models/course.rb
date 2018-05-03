class Course < ApplicationRecord
  belongs_to :certagency
  has_many :abletoteaches
end
