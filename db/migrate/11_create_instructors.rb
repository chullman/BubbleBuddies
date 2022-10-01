class CreateInstructors < ActiveRecord::Migration[6.1]
  def change
    create_table :instructors do |t|
      t.references :certagency, foreign_key: true
      t.integer :total_dives
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
