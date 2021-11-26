# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates_numericality_of :price
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def price=(input)
    input.delete!('$')
    super
  end
end
