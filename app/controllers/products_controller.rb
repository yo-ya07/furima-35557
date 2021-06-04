class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order(:id)
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
  
  # def show
  #   @product  = Product.new
  #   # @product = Product.find_by(id: params[:id])
  #   # @product = Product.includes(:user).find(params[:id])
  #   # @product  = Product.new(product_params)
  #   # @user = User.find_by(id: @product.user_id)
  # end


  # def edit
  #   @product  = Product.new
  # end

  # def update
  #   @product  = Product.new
  # end

  # def destroy
  #   @product  = Product.new
  # end
  
  private
  def product_params
    params.require(:product).permit(:image, :name, :info, :category_id, :status_id, :postage_id, :region_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end
end
