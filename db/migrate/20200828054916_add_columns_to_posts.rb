class AddColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :postcode, :integer
    add_column :posts, :prefecture_code, :integer
    add_column :posts, :address_city, :string
    add_column :posts, :address_street, :string
    add_column :posts, :address_building, :string
  end
end
