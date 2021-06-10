class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :set_product, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
    binding.pry
    if current_user == @purchase_address.user
      　redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def purchase_params
    params.require(:purchase_address).permit(
      :postcode, 
      :region_id, 
      :city, 
      :street_address, 
      :state, 
      :phone_number
    ).merge(
      user_id: current_user.id,
      product_id: params[:product_id],
      token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price, 
      card: purchase_params[:token], 
      currency: 'jpy' 
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def sold_item
    redirect_to root_path if @product.purchase.present?
  end
end
