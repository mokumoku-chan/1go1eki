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


  validates :email, presence: true
  validates :name, presence: true, length: {in: 1..255}
  validates :telephone_number, presence: true, length: {in: 1..255}, format: { with: /\A\d{10,11}\z/ }
  validates :postal_code, presence: true, length: {in: 1..255}, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true

  def active_for_authentication?
    super && is_active?
  end


  def inactive_message
    is_active?
  end


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
