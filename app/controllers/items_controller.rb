class ItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_current_user

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.find(params[:id])

    if @item.save
      redirect_to root_path
    else
      render :new, alert: @item.errors.full_messages
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
   end

  def set_item
    @item = Item.find(params[:id])
  end
end
