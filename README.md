# テーブル設計

## usersテーブル
| Column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| user_password   | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | string | null: false |

### Association
* belongs_to :delivery
* has_many :product


## deliveryテーブル
| Column                  | Type   | Options     |
|-------------------------|--------|-------------|
| delivery_postcode       | string | null: false |
| delivery_street_address | string | null: false |
| delivery_country        | string | null: false |
| delivery_city           | string | null: false |
| delivery_state          | string | null: false |
| delivery_phone_number   | string | null: false |

### Association
* belongs_to :user
* has_one :product


## productテーブル
| Column        | Type   | Options     |
|---------------|--------|-------------|
| items_name    | string | null: false |
| items_info    | string | null: false |
| category      | string | null: false |
| status        | string | null: false |
| postage       | string | null: false |
| region        | string | null: false |
| shipping_date | string | null: false |
| price         | string | null: false |


### Association
- belongs_to :user
- belongs_to :delivery