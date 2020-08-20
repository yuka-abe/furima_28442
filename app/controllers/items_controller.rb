class ItemsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_item, except: [:index, :new, :create ]
  before_action :set_current_user
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end


  def create
  
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, alert: @item.errors.full_messages
    end
  end

  

  private
  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
