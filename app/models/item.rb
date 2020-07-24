class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
end
