class OrdersController < ApplicationController
  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
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
  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_no, :token)
  end
end
