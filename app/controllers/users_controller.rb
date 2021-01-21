class UsersController < ApplicationController
  def show
    @user = current_user # Restaurant.find(params[:id])
  end
end
