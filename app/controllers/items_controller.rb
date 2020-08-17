class ItemsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_item, except: [:index, :new, :create ]


  def index
  end

  def new
    @item = Items.new
  end


  def create
    # binding.pry
    @item = Items.new(item_params)

    if @item.valid?
      @item.save
      redirect_to "/"
    else
      render :new, alert: @item.errors.full_messages
    end
  end



  private
  def item_params
    params.require(:items).permit(:name, :image, :text, :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
