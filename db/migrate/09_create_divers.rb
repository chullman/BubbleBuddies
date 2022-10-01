class CreateDivers < ActiveRecord::Migration[6.1]
  def change
    create_table :divers do |t|
      t.references :certagency, foreign_key: true
      t.integer :total_dives
      t.references :user, foreign_key: true
      t.references :qualification, foreign_key: true

      t.timestamps
    end
  end
end
