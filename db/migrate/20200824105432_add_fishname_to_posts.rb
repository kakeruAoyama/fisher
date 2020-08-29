class AddFishnameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :fishname, :string
  end
end
