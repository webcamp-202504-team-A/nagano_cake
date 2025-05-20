class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "商品を登録しました"
    else
      @genres = Genre.all
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price_without_tax, :is_active, :genre_id, :image)
  end
end
