# テーブル設計

## users テーブル

| Column   | Type     | Options            |
| -------- | -------- | ---------------------- |
| nickname | string   | null: false            |
| email    | string   | null: false            |
| password | string   | null: false            |
| first_name | string   | null: false, index |
| last_name | string   | null: false, index |
| first_name_kana | string   | null: false, index |	
| last_name_kana | string   | null: false, index |
| birthday | date | null: false |

Association
- has_many : items
- has_many : delivery



## items テーブル
| Column      | Type       | Options |
| ----------  | ---------- | ------- |
| image | string | null: false, active_hash |
| name | string     | null: false |
| text | text | null: false |
| status | integer | null: false, active_hash|
| category | integer | null: false, active_hash |
| delivery_fee | integer | null: false, active_hash |
| area | integer | null: false, active_hash |
| days | integer | null: false, active_hash |
| user | references | null: false,foreign_key: true|

Association
- belongs_to :user
- has_one : delivery


## address テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal      | string | null: false |
| prefectures | integer | null: false|
| city        | string | null: false |
| address     | string | null: false |
| building    | string |  |
| phone       | string | null: false |
| delivery | references | null:false, foreign_key: true|

Association
- belongs_to :delivery


## deliveries テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| user | references | null: false ,foreign_key: true |
| item | references | null: false ,foreign_key: true |

Association
- belongs_to :item
- belongs_to :user
- has_one : address
