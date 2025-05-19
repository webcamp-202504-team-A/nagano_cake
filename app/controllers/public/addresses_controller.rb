class Public::AddressesController < ApplicationController
  # TODO: ログインしていない時にアクセスするとログイン画面へ遷移
  # before_action :authenticate_user!

  # 他人のアクセス防止

  def index
    @new_address = Address.new

    # customer = Customer.find(current_user.id)
    # @address = customer.address

    # @address = current_user.address
  end

  def edit
  end

  def create
    @new_address = Address.new(address_params)
    @new_address.customer_id = current_user.id

    if @new_address.save
      redirect_to request.referer
    else
      render "index"
    end
  end

  def update
  end

  def detroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
