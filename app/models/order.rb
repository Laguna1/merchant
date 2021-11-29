# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :address, optional: true
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  def total
    order_items.map(&:subtotal).sum
  end
end
