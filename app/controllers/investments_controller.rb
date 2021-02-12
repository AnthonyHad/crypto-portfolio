class InvestmentsController < ApplicationController

  def index
    @investments = current_user.investments
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
end

