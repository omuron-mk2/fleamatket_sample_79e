# DB 設計

## users テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| nickname | string | null:false |
| email   | string | null:false, unique: true |
| password | string | null:false |
| last_name |string| null:false |
| first_name | string | null:false |
| last_name_kana |string | null:false |
| first_name_kana | string | null:false |
| birth_year | integer | null:false |
| birth_month | integer | null:false |
| birth_day | date | null:false |
| tel_number | string ||
| profile_text | text ||
| profile_image | string ||

### Association

- has_many :items, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_one :address, dependent: :destroy


## addresses テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| send_last_name | string | null:false |
| send_first_name |string | null:false |
| send_last_name_kana |string | null:false |
| send_first_name_kana | string | null:false |
| postal_code | integer | null:false |
| prefecture_id(active_hash) | integer | null:false |
| city |string | null:false |
| house_number | integer | null:false |
| room_number | integer ||
| user | references | null:false, foreign_key: true |

### Association

- belongs_to :user


## items テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| name | string | null:false |
| text | text | null:false |
| price | string | null:false |
| condition | string | null:false |
| category | references | null:false, foreign_key: true|
| brand | references | foreign_key: true |
| delivery_fee | integer | null:false |
| prefecture_id(active_hash) | integer |null: false|
| days | string | null:false |
| seller_id | integer | null:false, foreign_key: true |
| buyer_id | integer | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images, dependent: :destroy


## images テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| image | string | null:false |
| item | references | null:false, foreign_key: true |

### Association

- belongs_to :item


## categories テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| name | string | null:false |
| ancestry | string |  |

### Association

- has_many :items
- has_ancestry


## brands テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| name | string |  |

### Association

- has_many :items


## cards テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| user | references | null:false, foreign_key: true |
| card_number | integer | null:false |
| customer_id | integer |  |

### Association

- belongs_to :user
