class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.string :name
      t.text :description
      t.boolean :is_commercial_trip
      t.string :location
      t.boolean :is_boat_required
      t.decimal :price
      t.integer :member_limit
      t.datetime :date

      t.timestamps
    end
  end
end
