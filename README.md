# DB 設計

## users テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| nickname | string | null:false |
| e-mail   | string | null:false, unique: true |
| password | string | null:false |
| last_name |string| null:false |
| first_name | string | null:false |
| last_name_kana |string | null:false |
| first_name_kana | string | null:false |
| birth_year | integer | null:false |
| birth_month | integer | null:false |
| birth_day | integer | null:false |
| send_last_name | string | null:false |
| send_first_name |string | null:false |
| send_last_name_kana |string | null:false |
| send_first_name_kana | string | null:false |
| postal_code | integer | null:false |
| prefecture | string | null:false |
| city|string | null:false |
| house_number | integer | null:false |
| room_number | integer ||
| tel_number | integer ||
| profile_text | text ||
| profile_image | string ||

### Association

- has_many :items
- has_many :cards


## items テーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| name | string | null:false |
| image | string | null:false |
| text | text | null:false |
| price | string | null:false |
| condition | string | null:false |
| category_id | integer | null:false, foreign_key: true|
| brand_id | integer | foreign_key: true |
| delivery_fee | integer | null:false |
| prefecture | string | null:false |
| days | string | null:false |
| user_id | integer | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand


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
| user_id | integer | null:false, foreign_key: true |
| card_number | integer | null:false |
| customer_id | integer |  |

### Association

- belongs_to :user


