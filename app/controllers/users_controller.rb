class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @items = @user.items
    @item = Item.new
  end
end
