class ItemsController < ApplicationController
  def create
    @item = Item.new( item_params )
    @user = current_user

    if @item.save
      redirect_to [@user], notice: "Item was saved successfully."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end
  end
  
  private

  def item_params
    params.require(:name)
  end
end
