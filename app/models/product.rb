# frozen_string_literal: true

class Product < ApplicationRecord
  validates_numericality_of :price
end
