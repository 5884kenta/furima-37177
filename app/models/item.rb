class Item < ApplicationRecord

  has_one :item_order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

   #カテゴリーの選択が「--」の時は保存できないようにする
   validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1  , message: "can't be blank"} 
end
