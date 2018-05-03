class Instructor < ApplicationRecord
  belongs_to :certagency
  belongs_to :user
end
