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

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze
  with_options presence: true do
    validates :name
    validates :info
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :region_id
      validates :shipping_date_id

      with_options numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                   format: { with: VALID_PRICE_REGEX } do
        validates :price
      end
    end
  end
end
