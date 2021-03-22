class CoinsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @coins = Coin.all
    @top_10 = Coin.find_top_ten
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
