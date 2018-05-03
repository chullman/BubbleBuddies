class CreateMeetupmembers < ActiveRecord::Migration[5.2]
  def change
    create_table :meetupmembers do |t|
      t.references :meetup, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_owner
      t.boolean :can_edit

      t.timestamps
    end
  end
end
