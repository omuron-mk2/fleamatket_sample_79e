class Card < ApplicationRecord
  belongs_to :user

  validates :card_number, presence: true
  validates :customer_id, presence: true

end
