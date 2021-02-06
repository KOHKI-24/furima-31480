# DB 設計

## users table
| Column             | Type                | Options                            |
|--------------------|---------------------|------------------------------------|
| nickname           | string              | null: false                        |
| email              | string              | null: false                        |
| password           | string              | null: false,unique:true,index:true |

### Association
* has_many :items
* has_one :profile, dependent: :destroy
* has_one :sending_destination, dependent: :destroy
* has_one :credit_card, dependent: :destroy


## profiles table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| first_name         | string              | null: false                   |
| family_name        | string              | null: false                   |
| first_name_kana    | string              | null: false                   |
| family_name_kana   | string              | null: false                   |
| birth_year         | date                | null: false                   |
| birth_month        | date                | null: false                   |
| birth_day          | date                | null: false                   |
| user               | references          | null: false,foreign_key: true |

### Association
* belongs_to :user


## sending_destinations table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| post_code          | integer(7)          | null: false                   |
| prefecture_code    | integer             | null: false                   |
| city               | string              | null: false                   |
| house_number       | string              | null: false                   |
| building_name      | string              |                               |
| phone_number       | integer             | unique: true                  |
| user               | references          | null: false,foreign_key: true |

### Association
* belongs_to :user


## credit_cards table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| card_number        | integer             | null: false  unique: true     |
| expiration_year    | integer             | null: false                   |
| expiration_month   | integer             | null: false                   |
| security_code      | integer             | null: false                   |
| user               | references          | null: false,foreign_key: true |

### Association
* belongs_to :user


## items table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| name               | string              | null: false                   |
| introduction       | text                | null: false                   |
| price              | integer             | null: false                   |
| item_condition     | references          | null: false,foreign_key: true |
| postage_payer      | references          | null: false,foreign_key: true |
| prefecture_code    | integer             | null: false                   |
| preparation_day    | references          | null: false,foreign_key: true |
| item_image         | references          | null: false,foreign_key: true |
| category           | references          | null: false,foreign_key: true |
| trading_status     | enum                | null: false                   |

### Association
* belongs_to_active_hash :item_condition
* belongs_to_active_hash :postage_payer
* belongs_to_active_hash :preparation_day


## records table
| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| seller             | references          | null: false,foreign_key: true |
| buyer              | references          | null: false,foreign_key: true |

### Association
* belongs_to :item