class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,              null: false
      t.text    :info,              null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :postage_id,        null: false
      t.integer :region_id,         null: false
      t.integer :shipping_date_id,  null: false
      t.integer :price,             null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
    # create_table :categorys do |t|
    #   t.string     :title        , null: false
    #   t.text       :text         , null: false
    #   t.integer    :genre_id     , null: false
    #   t.timestamps
    # end
  end
end