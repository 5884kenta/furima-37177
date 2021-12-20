class Order < ApplicationRecord
  belongs_to :item_order

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true , numericality: {/^\d{10}$|^\d{11}$/}

end
