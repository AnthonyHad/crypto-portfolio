class InvestmentsController < ApplicationController

  def index
    @investments = current_user.investments
  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(params[:investment])
    @investment.user = current_user
    if @ginvestment.save
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

end
