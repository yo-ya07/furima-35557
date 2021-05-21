# テーブル設計

## usersテーブル
| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_name_kana       | string | null: false              |
| first_name_kana      | string | null: false              |
| birth_day            | date   | null: false              |

### Association
* belongs_to :purchase
* belongs_to :address
* has_many :product


## addressテーブル
| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| address_postcode       | string     | null: false       |
| address_street_address | string     | null: false       |
| address_country        | string     | null: false       |
| address_city           | string     | null: false       |
| address_state          | string     | null: false       |
| address_phone_number   | string     | null: false       |
| user                   | references | foreign_key: true |

### Association
* belongs_to :user
* has_one :product


## productテーブル
| Column           | Type       | Options           |
|------------------|------------|-------------------|
| items_name       | string     | null: false       |
| items_info       | string     | null: false       |
| category         | string     | null: false       |
| status_id        | status     | null: false       |
| postage_id       | status     | null: false       |
| region_id        | status     | null: false       |
| shipping_date_id | status     | null: false       |
| price            | string     | null: false       |
| user             | references | foreign_key: true |
| address          | references | foreign_key: true |
| purchase         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :address


## purchaseテーブル
| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| buy-item-text   | string     | null: false       |
| item-price-text | string     | null: false       |
| created_at      | datetime   | null: false       |
| updated_at      | datetime   | null: false       |
| user            | references | foreign_key: true |
| product         | references | foreign_key: true |

### Association
* belongs_to :user
* belongs_to :product