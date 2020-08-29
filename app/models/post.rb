class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
