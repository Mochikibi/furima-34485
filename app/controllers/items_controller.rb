class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :same_actions, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :price, :sales_status_id, :delivery_fee_id, :prefecture_id,
                                 :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in? && current_user.id != @item.user.id
      redirect_to action: :index 
  end
end

  def same_actions
    @item = Item.find(params[:id])
  end

end

