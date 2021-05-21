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
* has_many :purchases
* has_many :products


## addressテーブル
| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| address_postcode       | string     | null: false       |
| address_street_address | string     | null: false       |
| address_country        | string     | null: false       |
| address_city           | string     | null: false       |
| address_state          | string     | null: false       |
| address_phone_number   | string     | null: false       |
| purchase               | references | foreign_key: true |

### Association
* belongs/ :purchase


## productテーブル
| Column           | Type       | Options           |
|------------------|------------|-------------------|
| items_name       | string     | null: false       |
| items_info       | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| postage_id       | integer    | null: false       |
| region_id        | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase


## purchaseテーブル
| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user            | references | foreign_key: true |
| product         | references | foreign_key: true |

### Association
* belongs_to :user
* belongs_to :product
* has_one :address