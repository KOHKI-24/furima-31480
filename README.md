# DB 設計

## users table
| Column             | Type                | Options                            |
|--------------------|---------------------|------------------------------------|
| nickname           | string              | null: false                        |
| email              | string              | null: false                        |
| encrypted_password | string              | null: false　　　　　　　　　         |
| first_name         | string              | null: false                   　　　|
| family_name        | string              | null: false                  　　　 |
| first_name_kana    | string              | null: false                  　　　 |
| family_name_kana   | string              | null: false                   　　　|
| birth_day          | date                | null: false                        |

### Association
* has_many :items
* has_one :profile, dependent: :destroy
* has_one :sending_destination, dependent: :destroy
* belongs_to :record


## sending_destinations table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| post_code          | string              | null: false                   |
| prefecture_code_id | integer             | null: false                   |
| city               | string              | null: false                   |
| house_number       | string              | null: false                   |
| building_name      | string              |                               |
| phone_number       | string              | unique: true                  |
| records            | references          | null: false,foreign_key: true |

### Association
* belongs_to :item


## items table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| name               | string              | null: false                   |
| introduction       | text                | null: false                   |
| price              | integer             | null: false                   |
| item_condition     | references          | null: false                   |
| postage_payer      | references          | null: false                   |
| prefecture_id      | integer             | null: false                   |
| preparation_day    | references          | null: false                   |
| category           | references          | null: false                   |
| trading_status     | enum                | null: false                   |

### Association
* belongs_to :sending_destination
* belongs_to :record


## records table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| user               | references          | null: false,foreign_key: true |
| item               | references          | null: false,foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item