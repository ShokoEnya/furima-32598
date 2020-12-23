class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :duration_id, :price).merge(user_id: current_user.id)
  end
end
