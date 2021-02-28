module ProductsHelper
    def print_price(price)
        number_to_currency price
    end
    def price=(input)
        input.delete!("$")
        super
    end

    def print_stock(stock)
        if stock > 0
          return true
        else
          return false
        end
    end
end
