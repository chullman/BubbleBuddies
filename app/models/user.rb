class User < ApplicationRecord
  rolify

  attr_accessor :input_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  mount_uploader :image, ImageUploader

  has_one_attached :image

  accepts_nested_attributes_for :roles

  has_many :meetupmembers
  has_many :meetups, through: :meetupmembers
  has_one :instructor
  has_one :skipper
  has_one :diver
  has_many :comments
end
