class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    if @cart_item.save
      flash[:notice] = "カートに商品を追加しました"
    else
      flash[:alert] = "追加に失敗しました"
    end

    @item = Item.find(@cart_item[:item_id])
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
    
  end
end
