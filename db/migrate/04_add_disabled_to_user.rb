class AddDisabledToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_disabled, :boolean
  end
end
