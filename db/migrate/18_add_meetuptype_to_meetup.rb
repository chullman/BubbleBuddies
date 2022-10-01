class AddMeetuptypeToMeetup < ActiveRecord::Migration[6.1]
  def change
    add_column :meetups, :meetup_type, :string
  end
end
