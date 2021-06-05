class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all.order(id: "DESC")
  end

  def new
    @product  = Product.new
  end

  def create
    @product  = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    if @product.update(product_params)
        redirect_to products_path
    else
      render :edit
    end
  end

  # def destroy
  #   @product  = Product.new
  # end
  
  private
  def product_params
    params.require(:product).permit(:image, :name, :info, :category_id, :status_id, :postage_id, :region_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
