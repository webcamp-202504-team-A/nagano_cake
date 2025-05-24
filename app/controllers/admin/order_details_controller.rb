class Admin::OrderDetailsController < Admin::BaseController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(production_status: params[:order_detail][:production_status])
    order = @order_detail.order
    if params[:order_detail][:production_status] == "in_production"
      order.update(status:"in_production")
    end
    
    if is_all_order_details_finished(order)
       order.update(status: "preparing_for_shipment")
    end
    
    flash[:notice] = "更新に成功しました。"
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

  def is_all_order_details_finished(order)
    order.order_details.each do |order_detail|
      if order_detail.production_status != 'finished'
        return false
      end
    end
     return true
  end
end
