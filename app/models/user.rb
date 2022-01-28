class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attachment :profile_image

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :email, presence: true
  validates :name, presence: true, length: {in: 1..255}
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }


  def active_for_authentication?
    super && is_active?
  end


  def inactive_message
    is_active?
  end


end
