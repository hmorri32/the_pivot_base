class Admin::ItemsController < ApplicationController
  before_action :find_item, only: [:update, :edit]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def update
    require_store_admin
    @item.update(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def edit
    require_store_admin
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id, :store_id)
  end

  def require_store_admin
    unless current_user && current_user.authorized?(@item.store)
      render file: "/public/404"
    end
  end

end
