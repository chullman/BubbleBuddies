class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  belongs_to :role

  has_many :meetupmembers
  has_many :instructors
  has_many :skippers
  has_many :divers
  has_many :comments
  
end
