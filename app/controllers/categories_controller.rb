class CategoriesController < ApplicationController
  def show
    category = Category.friendly.find(params[:category])
    @category_items = category.items.paginate(page: params[:page], per_page: 20)
 end
end
