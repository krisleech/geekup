module Fish
  class MarketChooser
    def initialize(markets)
      @markets = markets
    end

    def best_market(cargo)
      result = @markets.map do |market|
        { :market => market, :quote => market.quote(cargo) }
      end

      result.sort_by { |quote| quote[:quote]}.last[:market]
    end
  end
end
