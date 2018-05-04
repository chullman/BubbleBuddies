class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :roles

  has_many :meetupmembers
  has_many :instructors
  has_many :skippers
  has_many :divers
  has_many :comments
  
end
