# README

<img src="https://i.gyazo.com/7d68ebe972ad64314319c0fc29ee11c3.png">


## accountsテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hira|string|null: false|
|last_name_hira|string|null: false|
|user_id|references|foreign_key:true|
|post_num|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|cuty_num|string|null :false|
|building|string|
|phone_num|string|

### Association
- belongs_to :user,dependent: :destroy



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null :false|
|emaill|string|null: false|
|password|string|null :false|
|birth_date|date|null :false|

### Association
- has_one :account
- has_many :addresses
- has_many :pays
- has_many :comments
- has_many :orders
- has_many :items



## addresses
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_hira|string|null: false|
|last_name_hira|string|null: false|
|user_id|references|foreign_key:true|
|post_num|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|cuty_num|string|null :false|
|building|string|
|phone_num|string|

### Association
- belongs_to :user,dependent: :destroy


## orders
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user



## pays
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|custmer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user,dependent: :destroy

## comments
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|text|string|null: false|

### Association
- belongs_to :user,dependent: :destroy
- belongs_to :item,dependent: :destroy





## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id||references|foreign_key: true|
|name|string|null: false, index :true|
|explannation|text|null: false|
|status|string|null: false|
|shipper|boolean|null: false|
|shipping_area|string|null: false|
|lead_time|integer|null: false|
|price|integer|null: false|
|category_id|references|foreign_key:true|
|brend_id|references|foreign_key:true|
|size|string|null: false|
|shipping_method|string|null: false|

- shipper
  - buyer's burden:false
  - seller bears  :true  

### Association
- belongs_to :user,dependent: :destroy
- has_one :order
- has_many :comments
- has_many :images
- belongs_to :brand
- belongs_to :category



## images
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item,dependent: :destroy



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







