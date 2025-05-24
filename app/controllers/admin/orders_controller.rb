class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.saved_change_to_status?
        case @order.status.to_sym
        when :payment_confirmed
          @order.order_details.each do |detail|
            detail.update(production_status: :waiting)
          end
        when :payment_pending
          @order.order_details.each do |detail|
            detail.update(production_status: :not_startable)
          end
        end
      end
      flash[:notice] = "注文ステータスを更新しました"
    else
      flash[:alert] = "更新に失敗しました"
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
