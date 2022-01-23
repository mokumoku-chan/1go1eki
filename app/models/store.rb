class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :homepages, dependent: :destroy
  has_many :storeinfo, dependent: :destroy
  has_many :item, dependent: :destroy
  has_many :store_image, dependent: :destroy
  attachment :image

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
       where(['name LIKE ?', "%#{search}%"])

    else
      all
    end
  end

end
