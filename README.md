# テーブル設計

## users テーブル

| Column   | Type     | Options            |
| -------- | -------- | ---------------------- |
| nickname | string   | null: false            |
| email    | string   | null: false            |
| password | string   | null: false            |
| name     | string   | null: false, add_index |
| name_kana | string   | null: false
| birthday | string | active_hash            |

Association
- has_many : items
- has_one : delivery



## items テーブル
| Column      | Type       | Options |
| ----------  | ---------- | ------- |
| image | integer | null: false |
| item_name | string     | null: false |
| text | text | null: false |
| status | string | null: false |
| category | integer | null: false, active_hash |
| delivery_fee | integer | null: false, active_hash |
| area | integer | null: false, active_hash |
| days | integer | null: false, active_hash |
| card_customer | string | null: false, active_hash |
| expiration_date | string | null: false, active_hash |
| security | string | null: false, active_hash |
| user_id | references | null: false,foreign_key: true|

Association
- belongs_to :user
- has_one : delivery


## address テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal      | string | null: false |
| prefectures | string | null: false, active_hash |
| city        | string | null: false |
| address     | string | null: false |
| building    | string |  |
| phone       | integer | null: false |
|item_id | references | null:false, foreign_key: true|

Association
- has_one :item

## deliveries テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| user_id | references | null: false ,foreign_key: true |
| item_id | references | null: false ,foreign_key: true |

Association
- belongs_to :item