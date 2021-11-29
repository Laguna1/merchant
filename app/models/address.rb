# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :line1, :city, :state, presence: true
  validates :state, format: { with: /[A-Z]{2}/ }
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }

  def to_s
    [line1, line2, "#{city}, #{state}, #{zip}"].compact.join(', ')
  end
end
