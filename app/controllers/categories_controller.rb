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
    respond_to do |format|
      format.html
      format.json {
        html_string = render_to_string('categories/_show_listing.html.erb', locals: {category: @category}, layout: false)
        render json: {template: html_string}
      }
    end
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
