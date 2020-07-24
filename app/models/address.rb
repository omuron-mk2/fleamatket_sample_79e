class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user

  validates :send_last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :send_first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :send_last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :send_first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true

end