class CreateSkippers < ActiveRecord::Migration[6.1]
  def change
    create_table :skippers do |t|
      t.references :user, foreign_key: true
      t.boolean :has_boat

      t.timestamps
    end
  end
end
