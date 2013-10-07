require 'spec_helper'

describe 'challenge 2' do
  it 'picks most profitable market' do
    nottingham_market = Fish::Market.new('Nottingham', 800, { :cod => 500,
                                    :crab => 450  })

    glasgow_market = Fish::Market.new('Glasgow', 1100, { :cod => 450,
                                    :octopus => 120 })

    leeds_market = Fish::Market.new('Leeds', 600, { :cod => 600,
                                    :octopus => 100,
                                    :crab => 500  })

    markets = [nottingham_market, glasgow_market, leeds_market]

    cargo = { :cod => 50, :octopus => 100, :crab => 50 }

    chooser = Fish::MarketChooser.new(markets)

    chooser.best_market(cargo).should == leeds_market
  end
end
