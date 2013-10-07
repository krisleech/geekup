module Fish
  class Market
    attr_reader :name, :dist, :prices

    def initialize(name, dist, prices)
      @name = name
      @dist = dist.to_f
      @prices = prices
    end

    def quote(cargo)
      result = 0

      cargo.each do |product_name, product_qty|
        result += prices.fetch(product_name, 0) * product_qty
      end

      return result if result == 0

      result -= degrade_cost(result)
      result -= travel_cost
      result
    end

    def travel_cost
      (@dist * 2)
    end

    def degrade_cost(price)
      price * (@dist / 10000)
    end
  end
end
