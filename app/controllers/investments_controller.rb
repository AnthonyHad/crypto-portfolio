require 'json'
require 'open-uri'

class InvestmentsController < ApplicationController

  def index
    @investments = current_user.investments
    investment_aggregation
  end


  def show
    @investment = Investment.where(coin_id: params[:coin_id])
    if @investment.empty?
      redirect_to investments_path
    end
  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.user = current_user
    if @investment.save
      update_coin_data(@investment)
      redirect_to investments_path, notice: "Transaction Successfully added!"
    else
      render :new
    end
  end

  def edit
    @investment = Investment.find(params[:id])
  end

  def update
    @investment = Investment.find(params[:id])
    @investment.update(investment_params)
    if @investment.save!
      redirect_to investment_path(@investment.coin_id)
    else
      render :new
    end
  end

  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy
    redirect_to investment_path(@investment.coin_id)
  end


  private

  def investment_params
    params.require(:investment).permit(:coin_id, :coin_price, :quantity)
  end

  def investment_aggregation
    coin_names = []
    @user_investments = {}
    total_invested = 0
    @investments.each do |investment|
      coin_names << investment.coin.name
    end
    s_names =  coin_names.uniq

    s_names.each do |name|
      @user_investments[name] = {}
    end

    @user_investments.each do |key, value|
      value[:price] = []
      value[:quantity]= []
      value[:investment_id] = []
       @investments.each do |investment|
          if investment.coin.name == key
            value[:investment_id] << investment.id
            value[:price]<< investment.coin_price
            value[:quantity] << investment.quantity
            value[:closing_price] = investment.coin.close
            value[:symbol] = investment.coin.symbol
            value[:total_invested] = value[:price].zip(value[:quantity]).map{ |x,y| x * y}.sum
            value[:coin_id] = investment.coin.id
          end
        end
      end
  return @user_investments
  end



def update_coin_data(investment)

  coin_id = investment.coin.api_id

  url = "https://api.coinpaprika.com/v1/coins/#{coin_id}/ohlcv/latest/"
  serialized = open(url).read
  parsed = JSON.parse(serialized)

    investment.coin.update(
      open: parsed[0]["open"],
      close: parsed[0]["close"],
      high: parsed[0]["high"],
      low: parsed[0]["low"],
      volume: parsed[0]["volume"],
      market_cap: parsed[0]["market_cap"]
      )
  end
end

