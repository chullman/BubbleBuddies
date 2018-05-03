class AddImageClUrlToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_cl_url, :string
  end
end
