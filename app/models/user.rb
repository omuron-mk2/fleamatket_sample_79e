class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_one :address, dependent: :destroy
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item", dependent: :destroy
  has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item", dependent: :destroy
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item", dependent: :destroy
  has_many :cards, dependent: :destroy

  validates :nickname, :email, presence: true
  validates :last_name, :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}

  attachment :profile_image
end