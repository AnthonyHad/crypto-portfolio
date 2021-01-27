class InvestmentsController < ApplicationController

  def index
    @investments = current_user.investments

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
