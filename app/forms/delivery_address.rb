class DeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefectures_id, :city, :address, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    post_code = /\A\d{3}[-]\d{4}\z/ # 郵便番号（ハイフンあり7桁）
    phone_code = /\A\d{10,11}\z/ # 電話番号(ハイフンなし10桁or11桁)

    # 住所に関するバリデーション
    validates :postal, format: { with: post_code, message: 'Input correctly' }
    validates :phone, format: { with: phone_code }
    validates :city
    validates :address
    # 都道府県に関するバリデーション
    validates :prefectures_id, numericality: { other_than: 1, message: 'select' }
    validates :item_id
    validates :user_id
  end

  def save
    # 住所の情報を保存
    delivery = Delivery.create(item_id: item_id, user_id: user_id)

    Address.create(postal: postal, prefectures_id: prefectures_id, city: city, address: address, building: building, phone: phone, delivery_id: delivery.id)
  end
end
