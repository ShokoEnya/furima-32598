class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building, :phone_no, :token

  belongs_to :prefecture
  
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)." }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_no, numericality: { only_integer: true, message: "is invalid. Input only numbers." }
    validates :token
  end
end