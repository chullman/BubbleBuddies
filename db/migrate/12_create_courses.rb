class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.boolean :is_certification_course
      t.boolean :is_speciality_course
      t.boolean :is_introductory_course
      t.references :certagency, foreign_key: true

      t.timestamps
    end
  end
end
