class CoinController < ApplicationController

  get '/' do 
    # p params
    @coin = Coin.all
    @coin.to_json
  end 

end 