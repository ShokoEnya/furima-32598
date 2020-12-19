# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| last_name_kanji       | string | null: false |
| first_name_kanji      | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| date_of_birth         | date   | null: false |

### Association

- has_many :items
- has_one :address
- has_many :order


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| dispatch_location_id | integer    | null: false                    |
| duration_id          | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| phone_no   | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false  foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- has_one :address
