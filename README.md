# README

## items

|Column               |Type      |Options    |
|name                 |string    |null: false|
|explain              |text      |null: false|
|category_id          |integer   |null: false|
|price                |integer   |null: false|
|sales_status_id      |integer   |null: false|
|delivery_fee_id      |integer   |null: false|
|prefecture_id        |integer   |null: false|
|scheduled_delivery_id|integer   |null: false|
|user_id              |references|foreign_key: true|

## users

|Column               |Type      |Options          |
|nick_name            |string    |null: false      |
|mail_address         |string    |null: false, unique: true|
|birth_date           |integer   |null: false|
|first_name           |string    |null: false|
|last_name            |string    |null: false|
|first_name_kana      |string    |null: false|
|last_name_kana       |          |null: false|


## purchases


|Column               |Type      |Options          |
|item_id              |references|foreign_key: true|
|user_id              |references|foreign_key: true|


## addresses


|Column               |Type      |Options          |
|postal code          |integer   |null: false      |
|prefecture_id        |integer   |null: false      |
|city                 |string    |null: false      |
|house_number         |string    |null: false      |
|phone_number         |string    |null: false      |


## Associations

users | has_many :items
      | has_many :purchases

items | has_one :item
      | belongs_to :user

purchases | belongs_to :item
          | belongs_to :user
          | has_one_to :address

addresses | belongs_to :purchase