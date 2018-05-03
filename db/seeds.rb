# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ role: 'admin' }, { role: 'normal' }])

Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'admin-diver.jpg'), :public_id => 'admin-diver')

user = User.new
user.email = 'admin@admin.com'
user.password = 'admin'
user.first_name = 'admin'
user.last_name = 'admin'
user.role = Role.where(role: 'admin').first
user.is_disabled = false
user.image_cl_url = Cloudinary::Utils.cloudinary_url('admin-diver')
user.save!

Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'test-diver.jpg'), :public_id => 'test-diver')

user = User.new
user.email = 'test@test.com'
user.password = 'test'
user.first_name = 'test'
user.last_name = 'test'
user.role = Role.where(role: 'normal').first
user.is_disabled = false
user.image_cl_url = Cloudinary::Utils.cloudinary_url('test-diver')
user.save!