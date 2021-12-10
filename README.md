# README
# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false ,unique: true|
| encrypted_password    | string | null: false |
| password-confirmation | string | null: false |
| last-name             | string | null: false |
| first-name            | string | null: false |
| last-name-kana        | string | null: false |
| first-name-kana       | string | null: false |
| birth-date            | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options     |
| ---------------------  | ------     | ----------- |
| name                   | string     | null: false |
| info                   | text       | null: false |
| category_id            | integer    | null: false |
| sales-status_id        | integer    | null: false |
| shipping-fee-status_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| scheduled-delivery_id  | integer    | null: false |
| price                  | string     | null: false |
| user                   | references | null: false, foreign_key: true |
| order                  | references | null: false, foreign_key: true |

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

| Column        | Type        | Options     |
| -------       | ----------  | ----------- |
| postal-code   | string      | null: false |
| prefecture_id | string      | null: false |
| city          | string      | null: false |
| addresses     | string      | null: false |
| building      | string      |             |
| phone-number  | string      | null: false |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_orders
- has_many :items, through: :item_orders
