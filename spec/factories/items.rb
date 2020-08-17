FactoryBot.define do
  factory :item do
    name {"文房具"}
    text {"文房具一式です"}
    price {"300"}
    category_id {１}
    status_id {２}
    delivery_fee_id {３}
    area_id {４}
    days_id {５}
    image {Faker::Lorem.sentence}
    association :user
    end
    
  end
end
