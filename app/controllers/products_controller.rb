class ProductsController < ApplicationController
  def index
      @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_product
    @products = Product.where(search_params).page(params[:page])
  end

  private
  def search_params
    params.require(:search_product).permit(:gender_type, :category)
  end
end