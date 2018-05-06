class Instructor < ApplicationRecord
  belongs_to :certagency
  belongs_to :user

  has_many :abletoteaches
  has_many :courses, through: :abletoteaches

  accepts_nested_attributes_for :courses
end
