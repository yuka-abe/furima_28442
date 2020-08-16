class ItemsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_item, except: [:index, :new, :create]

  #def root

  def index
  end

  def new
    @item = Items.new
  end


  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to "/"
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).parmit(:name, :image, :text, :category_id, :status_id, :delivery_fee_id, :area_id, :days_id)
  end

end
