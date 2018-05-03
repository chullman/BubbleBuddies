class CreateAbletoteaches < ActiveRecord::Migration[5.2]
  def change
    create_table :abletoteaches do |t|
      t.references :instructor, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
