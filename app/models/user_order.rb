class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building, :phone_no, :seller_id, :buyer_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)." }
    validates :prefecture_id, numericality: { other_than: 1, message: "needs to be selected" }
    validates :city
    validates :addresses
    validates :phone_no, numericality: { only_integer: true, message: "is invalid. Input only half-width numbers." }, length: { maximum: 11 }
  end

  def save
    order = Order.create(item_id: item_id, user_id: buyer_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_no: phone_no, order_id: order.id)
  end
end