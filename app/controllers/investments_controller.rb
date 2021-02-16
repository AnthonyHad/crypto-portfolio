class InvestmentsController < ApplicationController

  def index
    @investments = current_user.investments
    investment_aggregation
  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.user = current_user
    if @investment.save
      redirect_to investments_path, notice: "Transaction Successfully added!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def investment_params
    params.require(:investment).permit(:coin_id, :coin_price, :quantity)
  end

  def investment_aggregation
    coin_names = []
    @user_investments = {}
    @investments.each do |investement|
      coin_names << investement.coin.name
    end
    s_names =  coin_names.uniq

    s_names.each do |name|
      @user_investments[name] = {}
    end
    @user_investments.each do |key, value|
      value[:price] = []
      value[:quantity]= []
       @investments.each do |investment|
          if investment.coin.name == key
            value[:price]<< investment.coin_price
            value[:quantity] << investment.quantity
          end
        end
      end
  return @user_investments
  end
end

