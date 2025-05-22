class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total_fee = @cart_items.sum do |cart_item|
      cart_item.amount * cart_item.item.price_with_tax
    end
  end

  def create
    cart_item = current_customer.cart_items
    .new(cart_item_params)
    existing_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])

    if existing_item
      existing_item.amount += cart_item_params[:amount].to_i
      if existing_item.save
        flash[:notice] = "カートの数量を更新しました"
      else
        flash[:alert] = "更新に失敗しました"
      end
    else
      cart_item.customer_id = current_customer.id
      if cart_item.save
        flash[:notice] = "カートに商品を追加しました"
      else
        flash[:alert] = "追加に失敗しました"
      end
    end

    @item = Item.find(cart_item[:item_id])
    redirect_to request.referer
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      flash[:notice] = "数量を変更しました"
    else
      flash[:alert] = "数量の変更に失敗しました"
    end
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    flash[:notice] = "アイテムを削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カートを空にしました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
