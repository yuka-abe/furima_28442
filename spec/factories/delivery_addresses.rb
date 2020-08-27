FactoryBot.define do
  factory :delivery_address do
    postal { '123-4567' }
    prefectures_id { 3 }
    city { 'さいたま市' }
    address { '1−1-1' }
    building { '東京ハイツ' }
    phone { 12_345_678_910 }
    user_id { 3 }
    item_id { 3 }
  end
end
