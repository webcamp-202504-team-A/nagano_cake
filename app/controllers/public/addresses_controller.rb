class Public::AddressesController < ApplicationController
  # TODO: ログインしていない時にアクセスするとログイン画面へ遷移
  before_action :authenticate_user!

  # 他人のアクセス防止

  def index
  end

  def edit
  end

  def create
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
