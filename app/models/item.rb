class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  #belongs_to :buyer, class_name: "User"
  belongs_to :brand
  accepts_nested_attributes_for :brand
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition, presence: true
  validates :delivery_fee, presence: true
  validates :prefecture_id, presence: true
  validates :days, presence: true
  validates :images, presence: true

  has_one :purchase, dependent: :destroy
end
