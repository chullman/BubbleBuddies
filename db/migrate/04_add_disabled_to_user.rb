class AddDisabledToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_disabled, :boolean
  end
end
