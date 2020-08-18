FactoryBot.define do
  factory :item do
    name {"文房具"}
    text {"文房具一式です"}
    price {300}
    category_id {2}
    status_id {3}
    delivery_fee_id {4}
    area_id {5}
    days_id {2}
    association :user
    
    
  end
end
