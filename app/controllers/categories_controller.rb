class CategoriesController < ApplicationController

  def new

  end

  def create

  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.all
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end
