# README
# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| password-confirmation | string | null: false |
| last-name             | string | null: false |
| first-name            | string | null: false |
| last-name-kana        | string | null: false |
| first-name-kana       | string | null: false |
| birth-date            | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| item-image              | string | null: false |
| item-name            | string | null: false |
| item-info    | text | null: false |
| item-category | string | null: false |
| item-sales-status            | string | null: false |
| item-shipping-fee-status            | string | null: false |
| item-prefecture     | string | null: false |
| item-scheduled-delivery      | string | null: false |
| item-price            | string | null: false |
| add-tax-price            | string | null: false |
| profit            | string | null: false |
| user            | references | null: false, foreign_key: true |
| order            | references | null: false, foreign_key: true |
### Association

- has_many :item_orders
- has_many :orders, through: :item_orders
- belongs_to :user

## item_orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| order   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card-number | string     | null: false |
| card-exp-month  | string     | null: false |
| card-exp-year | string     | null: false |
| card-cvc | string     | null: false |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_many :item_orders
- has_many :items, through: :item_orders
- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal-code | string     | null: false |
| prefecture  | string     | null: false |
| city | string     | null: false |
| addresses | string     | null: false |
| building   | string | null: false |
| phone-number   | string | null: false |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :order
