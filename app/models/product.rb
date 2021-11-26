# frozen_string_literal: true

class Product < ApplicationRecord
  validates_numericality_of :price
  validates_numericality_of :stock, only_integer: true, greater_than_or_equal_to: 0
end
