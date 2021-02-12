# README

## items

|Column               |Type      |Options    |
|---------------------|----------|-----------|
|name                 |string    |null: false|
|explain              |text      |null: false|
|category_id          |integer   |null: false|
|price                |integer   |null: false|
|sales_status_id      |integer   |null: false|
|delivery_fee_id      |integer   |null: false|
|prefecture_id        |integer   |null: false|
|scheduled_delivery_id|integer   |null: false|
|user                 |references|foreign_key: true|

## Associations
items | has_one :purchase
      | belongs_to :user


## users

|Column               |Type      |Options          |
|---------------------|----------|-----------------|
|nick_name            |string    |null: false      |
|email                |string    |null: false, unique: true|
|encrypted_password   |string    |null: false|
|birth_date           |date      |null: false|
|first_name           |string    |null: false|
|last_name            |string    |null: false|
|first_name_kana      |string    |null: false|
|last_name_kana       |string    |null: false|

## Associations

users | has_many :items
      | has_many :purchases


## purchases


|Column               |Type      |Options          |
|---------------------|----------|-----------------|
|item                 |references|foreign_key: true|
|user                 |references|foreign_key: true|


## Associations
purchases | belongs_to :item
          | belongs_to :user
          | has_one_to :address


## addresses


|Column               |Type      |Options          |
|---------------------|----------|-----------------|
|postal_code          |string    |null: false      |
|prefecture_id        |integer   |null: false      |
|city                 |string    |null: false      |
|house_number         |string    |null: false      |
|phone_number         |string    |null: false      |
|building_name        |string    |                 |
|purchase             |references|foreign_key: true|


## Associations
addresses | belongs_to :purchase