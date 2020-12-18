# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name_kanji       | string | null: false |
| first_name_kanji      | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| date_of_birth         | string | null: false |

### Association

- has_many :products
- has_one :delivery
- has_one :purchase


## products テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             |            | null: false                    |
| product_name      | string     | null: false                    |
| description       | text       | null: false                    |
| category          | string     | null: false                    |
| status            | string     | null: false                    |
| delivery_fee      | string     | null: false                    |
| dispatch_location | string     | null: false                    |
| duration          | string     | null: false                    |
| price             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## deliveries テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| phone_no   | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_no       | string     | null: false                    |
| expiry_month  | string     | null: false                    |
| security_code | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
