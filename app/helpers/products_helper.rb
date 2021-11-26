module ProductsHelper
#   def print_price(price)
#     format('$%.2f', price)
#   end

  def print_price(price)
    number_to_currency price
  end
end
