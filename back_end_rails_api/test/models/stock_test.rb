require 'test_helper'

class StockTest < ActiveSupport::TestCase
  def setup 
    @stock = Stock.create(stock_symbol: "yes", amount_of_stock: 2)
  end

  test 'stock is present' do
    assert @stock.id, "returns id of user"
  end
  

end
