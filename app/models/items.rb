class Items < ApplicationRecord
  

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to :user


   #空の投稿を保存できないようにする
  with_options presence: true do
    half_width_figure = /\A[0-9]+\z/ #半角数字

    validates :image
    validates :name
    validates :text
    validates :price, numericality: { with: half_width_figure, only_integer: true, greater_then_or_equal_to: 300, less_than_or_equal_to: 9999999}

   #ジャンルの選択が「--」の時は保存できないようにする
    validates :category, numericality: { other_than: 1 }
    validates :status, numericality: { other_than: 1 }
    validates :delivery_fee, numericality: { other_than: 1 }
    validates :area, numericality: { other_than: 1 }
    validates :days, numericality: { other_than: 1 }
  end



end
