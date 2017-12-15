class ItemsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update]
  before_action :find_item, only: [:show, :edit, :update] 

	def index
		@items = Item.all
	end

	def show
	end

  def edit
  end

  def update
    format_price
    if @item.update(item_params)
      flash[:message] = "#{@item.title} updated!"
      redirect_to item_path(@item)
    else
      redirect_to edit_item_path(@item)
    end
  end

  private

    def find_item
      @item = Item.find(params[:id])
    end

    def authorize_user
      find_item
      unless current_user && current_user.authorized?(@item.store)
        render '404'
      end
    end
    
    def format_price
      params[:price] = params[:price].tr("$", " ")
    end

    def item_params
      params.permit(:title, :price, :condition, :description)
    end

end
