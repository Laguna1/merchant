# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # validates :order_id, presence: true
  # validates :product_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def subtotal
    quantity * product.price
  end
end
