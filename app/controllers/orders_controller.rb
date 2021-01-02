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
      pay_item
      @user_order.save
      @item.update(buyer_id: current_user.id)
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
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_no).merge(seller_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_index
    if @item.seller_id == current_user.id  || @item.buyer_id.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
