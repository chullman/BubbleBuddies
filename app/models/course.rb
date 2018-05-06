class Course < ApplicationRecord
  belongs_to :certagency

  has_many :abletoteaches
  has_many :instructors, through: :abletoteaches
end
