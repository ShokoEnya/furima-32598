class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :move_to_index

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_no).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
