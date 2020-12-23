class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status
  end
end
