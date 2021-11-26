# frozen_string_literal: true

module ProductsHelper
  #   def print_price(price)
  #     format('$%.2f', price)
  #   end

  def print_price(price)
    number_to_currency price
  end

  def print_stock(stock, requested = 1)
    if stock < requested
      content_tag(:span, 'Out of Stock')
    elsif stock > requested
      content_tag(:span, "In Stock (#{stock}) ")
    else
      content_tag(:span, "Insufficient stock (#{stock})", class: "low_stock")
    end
  end
end
