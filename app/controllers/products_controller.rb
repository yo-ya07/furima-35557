class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :user_validation, only: [:edit, :update]
  before_action :user_deletion, only: [:destroy]

  def index
    @products = Product.all.order(id: 'DESC')
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
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :info, :category_id, :status_id, :postage_id, :region_id, :shipping_date_id,
                                    :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def user_validation
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def user_deletion
    unless Product.find(params[:id]).user.id.to_i == current_user.id
      redirect_to products_path
    end
  end
end
