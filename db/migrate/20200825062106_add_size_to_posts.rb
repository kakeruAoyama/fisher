class AddSizeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :size, :float
  end
end
