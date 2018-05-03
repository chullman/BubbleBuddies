class CreateCertagencies < ActiveRecord::Migration[5.2]
  def change
    create_table :certagencies do |t|
      t.string :cert_agency

      t.timestamps
    end
  end
end
