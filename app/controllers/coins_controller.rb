class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end


  def new
    @coin = Coin.new
  end

  def create
    @coin = Coin.new(coin_params)
    if @coin.save
      redirect_to coins_path
    else
      render :new
    end
  end


  private

  def coin_params
    params.require(:coin).permit(:name, :open, :close, :high, :low, :volume, :market_cap)
  end
end
