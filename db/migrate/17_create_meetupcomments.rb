class CreateMeetupcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :meetupcomments do |t|
      t.references :meetup, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
