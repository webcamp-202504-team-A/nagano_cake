class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create 
  end

  def confirm
    @order = Order.new(order_params.except(:address_type, :address_id))
    @order.customer = current_customer
    case params[:order][:address_type]
    when  "member_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when "registered_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    when "new_address"
    else
      flash[:alert] = "住所の選択に問題があります"
      redirect_to new_order_path
    end
  end

  def complate
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
