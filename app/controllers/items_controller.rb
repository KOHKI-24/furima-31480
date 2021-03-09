class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  # def destroy
  #   redirect_to root_path
  # end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
  
  def item_params
    params.require(:item).permit(:name, :price, :image).merge(user_id: current_user.id)
  end

end
