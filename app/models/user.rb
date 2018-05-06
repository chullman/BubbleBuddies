class User < ApplicationRecord
  rolify

  attr_accessor :input_roles
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :roles

  has_many :meetupmembers
  has_one :instructor
  has_one :skipper
  has_one :diver
  has_many :comments
  
end
