class Item < ApplicationRecord

  has_one :item_order
  belongs_to :user
  has_one_attached :image

end
