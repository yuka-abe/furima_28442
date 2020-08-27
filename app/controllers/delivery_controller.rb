class DeliveryController < ApplicationController
  before_action :authenticate_user!
  before_action :seller_redirect

  def index
    @delivery_address = DeliveryAddress.new
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @delivery_address = DeliveryAddress.new(delivery_address_params)

    if @delivery_address.valid?
      pay_item
      @delivery_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def delivery_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 支払金額
      card: delivery_params[:token], # カードトークン
      currency: 'jpy'                  # 通過の種類(日本円)
    )
  end

  def seller_redirect
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def delivery_address_params
    params.permit(:postal, :prefectures_id, :city, :address, :building, :phone, :token, :item_id).merge(user_id: current_user.id)
  end
end
