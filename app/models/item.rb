class Item < ApplicationRecord
  

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  belongs_to :user
  has_one_attached :image

    #空の投稿を保存できないようにする
  with_options presence: true do
    half_width_figure = /\A[0-9]+\z/ #半角数字

    validates :image
    validates :name 
    validates :text  
    validates :price, numericality: { with: half_width_figure, only_integer: true }

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
  end
  
  validates_inclusion_of :price, in: 300..9999999 


end
