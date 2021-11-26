# frozen_string_literal: true

module ProductsHelper
  #   def print_price(price)
  #     format('$%.2f', price)
  #   end

  def print_price(price)
    number_to_currency price
  end

  def print_stock(stock)
    if stock.positive?
      content_tag(:span, "Stock (#{stock}) ")
    else
      content_tag(:span, 'Out of Stock')
    end
  end
end
