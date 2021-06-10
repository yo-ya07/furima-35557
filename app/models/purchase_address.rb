class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, 
                :product_id, 
                :postcode, 
                :region_id, 
                :city, 
                :street_address, 
                :state,
                :phone_number,
                :token

  VALID_POST_REGEX  = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_REGEX = /\A\d{11}\z/
  with_options presence: true do
    validates :region_id
    validates :city
    validates :street_address
    validates :token

    with_options format: { with: VALID_POST_REGEX } do
      validates :postcode
    end

    with_options format: { with: VALID_PHONE_REGEX } do
      validates :phone_number
    end
  end

  def save
    purchase = Purchase.create(
      user_id: user_id,
      product_id: product_id)
    Address.create(
      postcode: postcode, 
      region_id: region_id, 
      city: city, 
      street_address: street_address, 
      state: state, 
      phone_number: phone_number, 
      state: state, 
      purchase_id: purchase.id)
  end
end