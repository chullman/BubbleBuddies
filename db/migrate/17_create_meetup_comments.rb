class CreateMeetupComments < ActiveRecord::Migration[5.2]
  def change
    create_table :meetup_comments do |t|
      t.references :meetup, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
