class Diver < ApplicationRecord
  belongs_to :certagency
  belongs_to :user
  belongs_to :qualification
end
