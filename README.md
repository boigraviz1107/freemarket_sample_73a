# README

## 本番環境IPアドレス: [http://3.113.122.135/](http://3.113.122.135/)


<img src="https://i.gyazo.com/7d68ebe972ad64314319c0fc29ee11c3.png">


## accounts
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|post_num|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|city_num|string|null :false|
|building|string|
|phone_num|string|

### Association
- belongs_to :user

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null :false|
|emaill|string|null: false|
|password|string|null :false|
|birth_date|date|null :false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hira|string|null: false|
|last_name_hira|string|null: false|

### Association
- has_one :account,dependent: :destroy
- has_many :addresses,dependent: :destroy
- has_many :pays,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_many :orders,dependent: :destroy
- has_many :items,dependent: :destroy

## orders
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## pays
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|customer_id|text|null: false|
|card_id|text|null: false|

### Association
- belongs_to :user

## comments
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|
|text|string|null: false|

### Association
- belongs_to :user
- belongs_to :item





## items
|Column|Type|Options|
|------|----|-------|
|user_id||references|null: false,foreign_key: true|
|name|string|null: false, index :true|
|explannation|text|null: false|
|status|string|null: false|
|shipper|boolean|null: false|
|shipping_area|string|null: false|
|lead_time|integer|null: false|
|price|integer|null: false|
|category_id|references|null: false,foreign_key:true|
|brand_id|references|foreign_key:true|
|size|string|null: false|
|shipping_method|string|null: false|

- shipper
  - buyer's burden:false
  - seller bears  :true

### Association
- belongs_to :user
- has_one :order
- has_many :comments,dependent: :destroy
- has_many :images,dependent: :destroy
- belongs_to :brand
- belongs_to :category



## images
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false,foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item



## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items



## categorys
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index|

### Association
- has_many :items







