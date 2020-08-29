class AddLatitudeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :latitude, :float
  end
end
