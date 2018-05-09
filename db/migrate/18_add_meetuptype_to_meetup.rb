class AddMeetuptypeToMeetup < ActiveRecord::Migration[5.2]
  def change
    add_column :meetups, :meetup_type, :string
  end
end
