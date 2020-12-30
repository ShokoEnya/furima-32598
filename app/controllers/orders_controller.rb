class OrdersController < ApplicationController
  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @user_order.valid?
      binding.pry
      @user_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    item = Item.find(params[:item_id])
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_no).merge(user_id: current_user.id, item_id: item.id)
  end
end
