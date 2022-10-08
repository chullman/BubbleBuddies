# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create name: :admin
Role.create name: :disabled
Role.create name: :normal

user = User.new
user.skip_confirmation!
user.email = "admin@admin.com"
user.password = "admin"
user.first_name = "admin"
user.last_name = "admin"
user.add_role :admin
user.add_role :normal
user.is_disabled = false
user.image = Rails.root.join("app", "assets", "images", "admin-diver.jpg").open
user.save!

user = User.new
user.skip_confirmation!
user.email = "test@test.com"
user.password = "test"
user.first_name = "test"
user.last_name = "test"
user.add_role :normal
user.is_disabled = false
user.image = Rails.root.join("app", "assets", "images", "test-diver.jpg").open
user.save!

Certagency.create([{ cert_agency: "PADI" }, { cert_agency: "SSI" }, { cert_agency: "NAUI" }])

Qualification.create([{ qualification: "Open Water" }, { qualification: "Advanced Open Water Diver" }, { qualification: "Rescue Diver" }, { qualification: "Master Scuba Diver" }, { qualification: "Divemaster" }, { qualification: "TEC or higher" }])

course = Course.new
course.course_name = "PADI Open Water Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = true
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "PADI Advanced Open Water Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "PADI Rescue Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "PADI Master Scuba Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "PADI Divemaster"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "PADI Nitrox Course"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "PADI IDC"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 1
course.save!

course = Course.new
course.course_name = "SSI Open Water Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = true
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Nitrox Course"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Perfect Buoyancy"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Advanced Open Water Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Master Diver"
course.is_certification_course = true
course.is_speciality_course = false
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Deep Diving"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Wreck Diving"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Deep Diving"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Night Diving"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Search & Recovery"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!

course = Course.new
course.course_name = "SSI Boat Diving"
course.is_certification_course = false
course.is_speciality_course = true
course.is_introductory_course = false
course.certagency_id = 2
course.save!
