class CreateMeetups < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups do |t|
      t.string :name
      t.boolean :is_commercial_trip
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.boolean :is_boat_required
      t.integer :price
      t.integer :member_limit
      t.datetime :date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
