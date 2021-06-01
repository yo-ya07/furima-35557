class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date
  # validates :title, :text,
  #   presence: true
  
  with_options presence: true do
    validates :name
    validates :info
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end
  
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price,
    presence: true,
    numericality: { only_integer: true,
      greater_than: 299, less_than: 10000000},
    format: { with: VALID_PRICE_REGEX }
    
end
