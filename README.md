# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true , unique: true|
|email|string|null: false, unique: true|
|password|integer|null: false|
|firstname_fullangle|string|null: false|
|lastname_fullangle|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday|date|null: false|
|postal_cord|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string||
|phone_number|integer|null: false|
|icon_image|string||
|profile|text||


### Association
* has_many :evaluations, dependent: :destroy
* has_many :products, dependent: :destroy
* has_many :chats, dependent: :destroy
* has_many :likes, dependent: :destroy


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|description|text|null: false|
|size|integer|null: false|
|condition|integer|null: false|
|select_shipping_feeh|integer|null: false|
|shipping_method|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|buyer_id|integer|index: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|likes_count|integer||
|status|integer|null: false, default: 1|

* condition＝商品の状態（モデルにリストを作成する）
* shipping_method＝運送方法（モデルにリストを作成する）
* shipping_feeh =配送料の負担の所在（モデルにリストを作成する）
* shipping_date=発送するまでの目安日数（モデルにリストを作成する）
* size=衣装のサイズ（モデルにリストを作成する）
* status=商品の出品状態（1:出品中、2:取引中、3:売却済、4:公開停止中）


### Association
* belongs_to :user
* has_many :likes, dependent: :destroy
* has_many :images, dependent: :destroy
* has_many :chats, dependent: :destroy
* belongs_to :brand
* belongs_to :category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|	
|product_id|references|null: false, foreign_key: true|	

### Association
* belongs_to :product


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|unique: true, null: false|
|name_initial|string||

### Association
* has_many :products
* has_many :categories, through: :brands_categories

## brands_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brands_id|references|null: false, foreign_key:true|
|category_id|references|null: false, foreign_key:true|

### Association
* belongs_to :brand
* belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name	|string	|unique: true, null: false|
|parent_id|references|null: false, foreign_key: true|
|size|boolean|null: false, default: false|

### Association
* has_many :products
* has_many :brands, through: :brands_categories
* belongs_to :parent, class_name: :Category
* has_many :children, class_name: :Category, foreign_key: :parent_id

## chatsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
* belongs_to :product
* belongs_to :user


## evaluations(評価)テーブル 

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|messes|text|null: false|

### Association
* belongs_to :user


## likes(いいね)テーブル
|Column|Type|Options|
|------|----|-------|
|product_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
* belongs_to :product, counter_cache: :likes_count
* belongs_to :user
