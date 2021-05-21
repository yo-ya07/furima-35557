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
| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postcode       | string     | null: false       |
| street_address | string     |                   |
| country_id     | integer    | null: false       |
| city           | string     | null: false       |
| state          | string     | null: false       |
| phone_number   | string     | null: false       |
| purchase       | references | foreign_key: true |

### Association
* belongs_to :purchase


## productテーブル
| Column           | Type       | Options           |
|------------------|------------|-------------------|
| name             | string     | null: false       |
| info             | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| postage_id       | integer    | null: false       |
| region_id        | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
* belongs_to :user
* has_one :purchase


## purchaseテーブル
| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user            | references | foreign_key: true |
| product         | references | foreign_key: true |

### Association
* belongs_to :user
* belongs_to :product
* has_one :address